public enum ByteCode: UInt8 {
    case NOP = 0x00
    case EXTENDED_ARG
    case LOAD_CONSTANT
    case PUSH_SMALL_INT
    case MAKE_FUNCTION
    case BINARY_OP
    case COMPARE_OP
    case POP_TOP
    case DUP_TOP
    case CALL
    case RETURN_VALUE
    case RETURN_CONSTANT
    case RETURN_NULL
    case JUMP_IF_TRUE
    case JUMP_IF_FALSE
    case JUMP_ABSOLUTE
    case JUMP_FORWARD
    case JUMP_BACKWARD
    case LOAD_NAME
    case STORE_NAME
    case LOAD_LOCAL
    case STORE_LOCAL
    case LOAD_GLOBAL
    case STORE_GLOBAL
    case LOAD_ATTR
    case STORE_ATTR
    case BUILD_LIST
    case BUILD_DICT
    public enum BinaryOp: UInt8 {
        case ADD = 0x00
        case SUB
        case MUL
        case DIV
        case MOD
        case POW
        case AND
        case OR
        case XOR
    }
    public enum CompareOp: UInt8 {
        case EQUAL = 0x00
        case NOT_EQUAL
        case LESS
        case LESS_EQUAL
        case GREATER
        case GREATER_EQUAL
    }
}
