import java.io.IOException;  
import org.apache.pig.EvalFunc;  
import org.apache.pig.data.Tuple;

import java.util.Random;

public class AssignRandomUDF extends EvalFunc<String>{
	public String[] tool={"MR","Pig","Hive","MongoDB"};
	public Random random= new Random();
  public String exec(Tuple input) throws IOException {
       try{
          int index=random.nextInt(4);
          return tool[index];
       }catch(Exception e){
           throw new IOException("Caught exception processing input row ", e);
       }
   }
}