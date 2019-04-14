DEF INPUT PARAM p_acct   AS CHAR NO-UNDO.
DEF INPUT PARAM p_cusip  AS CHAR NO-UNDO.
DEF INPUT PARAM p_stl_dt AS CHAR NO-UNDO.
DEF INPUT PARAM p_qty    AS DEC  NO-UNDO.
DEF INPUT PARAM p_amt    AS DEC  NO-UNDO.
DEF OUTPUT PARAM p_error AS CHAR NO-UNDO.



FIND FIRST mfclac NO-LOCK
  WHERE mfclac.acct = p_acct
  NO-ERROR.

IF NOT AVAIL mfclac
THEN DO:
   p_error = "invalid account".
   RETURN.
END.

FIND FIRST mfsc NO-LOCK
  WHERE mfsc.cusip = p_cusip
  NO-ERROR.

IF NOT AVAIL mfsc
THEN DO:
  p_error = "invalid security".
  RETURN.
END.


RETURN "".


 

 

