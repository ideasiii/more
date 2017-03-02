/**
 * @author Louis Ju
 * @date 2015-07-30
 * @descript define common data type
 */

package more;

public abstract class Type
{
    public static final int TRUE = 1;
    public static final int FALSE = 0;
    public static final int INVALID = -1;
    public static final int VALID = TRUE;
    public static final int TRACE_LEVEL_SIMPLE = 1;
    public static final int TRACE_LEVEL_NORMAL = TRACE_LEVEL_SIMPLE + 1;
    public static final int TRACE_LEVEL_DETAIL = TRACE_LEVEL_NORMAL + 1;
    public static final int DEVICE_PHONE = 0;
    public static final int DEVICE_TABLET = 1;
}
