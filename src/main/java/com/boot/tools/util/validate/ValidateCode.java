package com.boot.tools.util.validate;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ValidateCode {

	private static final long serialVersionUID = -7427389730037711903L;

	//验证码图片的宽度。
	private static int width = 80; 
	//验证码图片的高度。
	private static int height = 32; 
	//验证码字符个数
	private static int codeCount = 4; 
	
	private static char[] codeSequence = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
			'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
			'X', 'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
	
	public static String getValidateCode(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		//定义图像buffer
		BufferedImage buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB); 
		
		Graphics g = buffImg.getGraphics();
		
		Font font = new Font("Times New Roman", Font.PLAIN, 20);
		
		//创建一个随机数生成器类
		Random random = new Random();

		g.setColor(getRandColor(200,250));
        g.fillRect(1, 1, width-1, height-1);
        g.setColor(new Color(102,102,102));
        g.drawRect(0, 0, width-1, height-1);
        g.setFont(font);
        g.setColor(getRandColor(160,200));
		
        //画随机线 
        for (int i=0;i<155;i++){
            int x = random.nextInt(width - 1);
            int y = random.nextInt(height - 1);
            int xl = random.nextInt(6) + 1;
            int yl = random.nextInt(12) + 1;
            g.drawLine(x,y,x + xl,y + yl);
        }
  
        //从另一方向画随机线 
        for (int i = 0;i < 70;i++){
            int x = random.nextInt(width - 1);
            int y = random.nextInt(height - 1);
            int xl = random.nextInt(12) + 1;
            int yl = random.nextInt(6) + 1;
            g.drawLine(x,y,x - xl,y - yl);
        }
		
		//randomCode用于保存随机产生的验证码，以便用户登录后进行验证。
		StringBuffer randomCode = new StringBuffer();
		
		//随机产生codeCount数字的验证码。
		for (int i = 0; i < codeCount; i++) {
			//得到随机产生的验证码数字。
			String strRand = String.valueOf(codeSequence[random.nextInt(codeSequence.length)]);
			
			g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
            g.drawString(strRand,15*i+10,22);
			//将产生的四个随机数组合在一起。
			randomCode.append(strRand);
		}
		
		HttpSession session = request.getSession();
		// 将四位数字的验证码保存到Session中。
		session.setAttribute("validateCode", randomCode.toString().toLowerCase());
		
		// 禁止图像缓存。
		response.setHeader("Pragma", "no-cache"); 
		response.setHeader("Cache-Control", "no-cache"); 
		response.setDateHeader("Expires", 0); 
		
		response.setContentType("image/jpeg"); 
		
		//将图像输出到Servlet输出流中。
		ServletOutputStream sos = response.getOutputStream(); 
		ImageIO.write(buffImg, "jpeg", sos); 
		sos.close(); 
		
		return null;
	}
	
	public static Color getRandColor(int fc,int bc){
		Random random = new Random();
        if(fc>255) fc=255;
        if(bc>255) bc=255;
        int r=fc+random.nextInt(bc-fc);
        int g=fc+random.nextInt(bc-fc);
        int b=fc+random.nextInt(bc-fc);
        return new Color(r,g,b);
	}
}
