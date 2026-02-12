public enum ByteCode: UInt8 {
  case NOP = 0x00
  case EXTENDED_ARG
  case LOAD_CONSTANT
  case PUSH_SMALL_INT
  case MAKE_FUNCTION
  case BINARY_OP
  case POP_TOP
  case DUP_TOP
  case CALL
  case RETURN_VALUE
  case RETURN_CONSTANT
  case RETURN_NULL

  public enum BinaryOp: UInt8 {
    case ADD = 0x00
    case SUBTRACT
    case MULTIPLY
    case DIVIDE
    case MODULO
    case POWER
    case LEFT_SHIFT
    case RIGHT_SHIFT
    case BIT_AND
    case BIT_OR
    case BIT_XOR
    case INPLACE_ADD
    case INPLACE_SUBTRACT
  }
}
