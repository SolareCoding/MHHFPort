import java.nio.file.*;
import com.jpexs.decompiler.flash.SWF;
import com.jpexs.decompiler.flash.tags.DoActionTag;
import com.jpexs.decompiler.flash.action.Action;
import com.jpexs.decompiler.flash.action.parser.script.ActionScript2Parser;

// Compile only our additional helper. Original character actions are not recompiled.
public class CompileAvm1 {
  public static void main(String[] args) throws Exception {
    SWF swf = new SWF();
    swf.version = 8;
    DoActionTag tag = new DoActionTag(swf);
    var actions = new ActionScript2Parser(swf, tag).actionsFromString(Files.readString(Path.of(args[0])), "UTF-8");
    Files.write(Path.of(args[1]), Action.actionsToBytes(actions, true, 8));
  }
}
