package AM_service;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;


public final class BuildPosterService {
	private static String ModelPath = "C:/WORK/Software_Engineering/Project/ActivityManagement/WebContent/images/PosterModel/";
	private static String TgtPath = "C:/WORK/Software_Engineering/Project/ActivityManagement/WebContent/images/PosterOutput/";
    /**图片格式：JPG*/
    private static final String PICTRUE_FORMATE_JPG = "jpg";
    
    private BuildPosterService(){}

    /**
     * 添加文字水印
     * @param targetImg 目标图片路径，如：C://myPictrue//1.jpg
     * @param pressText 水印文字， 如：中国证券网
     * @param fontName 字体名称，    如：宋体
     * @param fontStyle 字体样式，如：粗体和斜体(Font.BOLD|Font.ITALIC)
     * @param fontSize 字体大小，单位为像素
     * @param color 字体颜色
     * @param x 水印文字距离目标图片左侧的偏移量，如果x<0, 则在正中间
     * @param y 水印文字距离目标图片上侧的偏移量，如果y<0, 则在正中间
     * @param alpha 透明度(0.0 -- 1.0, 0.0为完全透明，1.0为完全不透明)
*/
    public static void pressText(String targetImg, String SrcImg, String pressText,  String fontName, int fontStyle, int fontSize, Color color, int x, int y, float alpha) {
        try {
            File file = new File(targetImg);
            File srcFile = new File(SrcImg);
            Image image = ImageIO.read(srcFile);
            int width = image.getWidth(null);
            int height = image.getHeight(null);
            BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            Graphics2D g = bufferedImage.createGraphics();
            g.drawImage(image, 0, 0, width, height, null);
            g.setFont(new Font(fontName, fontStyle, fontSize));
            g.setColor(color);
            g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, alpha));
            
            int width_1 = fontSize * getLength(pressText);
            int height_1 = fontSize;
            int widthDiff = width - width_1;
            int heightDiff = height - height_1;
            if(x < 0){
                x = widthDiff / 2;
            }else if(x > widthDiff){
                x = widthDiff;
            }
            if(y < 0){
                y = heightDiff / 2;
            }else if(y > heightDiff){
                y = heightDiff;
            }
            
            g.drawString(pressText, x, y + height_1);
            g.dispose();
            ImageIO.write(bufferedImage, PICTRUE_FORMATE_JPG, file);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static int getLength(String text) {
        int textLength = text.length();
        int length = textLength;
        for (int i = 0; i < textLength; i++) {
            if (String.valueOf(text.charAt(i)).getBytes().length > 1) {
                length++;
            }
        }
        return (length % 2 == 0) ? length / 2 : length / 2 + 1;
    }


    public static void WritePoster(String ActivityName, String ActivityTime, String ActivityPlace, String[] ActivityContent, String Hoster, int ActNum) {
    	String PosterModels[] = new String[5];
    	for(int i = 0; i < 5; i++) {
    		PosterModels[i] = new String();
    		PosterModels[i] = ModelPath + "P" + Integer.toString(i + 1) + ".jpg";
//    		System.out.println(PosterModels[i]);
    	}
    	Random r = new Random();
    	int Choice = r.nextInt(5);
    	String RandomPoster = PosterModels[Choice];
    	String OutputPoster = TgtPath + ActNum + ".jpg";
    	pressText(OutputPoster, RandomPoster, ActivityName, "幼圆", Font.BOLD, 120, Color.BLACK, 100, 100, .8f);
    	pressText(OutputPoster, OutputPoster, ActivityTime, "幼圆", Font.BOLD, 100, Color.BLACK, 500, 380, .8f);
    	pressText(OutputPoster, OutputPoster, ActivityPlace, "幼圆", Font.BOLD, 100, Color.BLACK, 20, 650, .8f);
    	for(int i = 0; i < ActivityContent.length; i++) {
    		pressText(OutputPoster, OutputPoster, ActivityContent[i], "方正姚体", Font.BOLD, 50, Color.WHITE, 20, 900+60*i, .8f);
    	}
    	pressText(OutputPoster, OutputPoster, Hoster, "幼圆", Font.BOLD, 80, Color.WHITE, 20, 1600, .8f);
    }
    
    
    
    public static void main(String[] args) throws IOException {
    	String [] AC = {"现场为大家解决哈尔滨工业大学招生的相关政策。", "学长现场详细讲述。","还有礼品赠送！"};
    	WritePoster("哈工大招生宣讲", "2016年12月1日", "正心楼11", AC , "哈尔滨工业大学学生会", 001);
    }
}