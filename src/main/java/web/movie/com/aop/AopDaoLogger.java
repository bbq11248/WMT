package web.movie.com.aop;

import org.aspectj.lang.JoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//AOP에서 실질적으로 실행되는 JAVA Class
//aop-context.xml 에 Bean으로 등록 되어 있음 이름 logAop
public class AopDaoLogger {
	
//	before
	public void before(JoinPoint j) {
		Logger logger = LoggerFactory.getLogger(j.getTarget()+"");
		logger.info("====AOP 시작 =====");
		
		// 전달받은 아규먼트
		Object[] args = j.getArgs();
		
		if(args != null) {
			logger.info("메소드명:"+j.getSignature().getName());
			for(int i = 0; i < args.length; i++) {
				logger.info("argument"+i+"번째:"+args[i]);
			}
			logger.info("메소드명:"+j.getSignature().getName());
		}
	}
//	afterReturning
	public void afterReturning(JoinPoint j) {
		Logger logger = LoggerFactory.getLogger(j.getTarget()+"");
		logger.info("====종료됨=====");
	}
//	afterThrowing
	public void afterThrowing(JoinPoint j) {
		Logger logger = LoggerFactory.getLogger(j.getTarget()+"");
		logger.info("====!에러!====="+j.toString());
	}

}
