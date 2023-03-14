function decode2(a) {
    function toint(a) {
      let l = a.length
      let ans = 0
      let m = 1
      for (let i = l - 1; i >= 0; i--) {
          if (a[i] == '1') {
              ans = ans + m
          }
          m = m * 2
      }
  
      return ans
  }
  function negative(a) {
      let m = 1
      let ans = 0;
      for (let i = a.length - 1; i > 0; i--) {
          if (a[i] == '1') {
              ans += m;
          }
          m *= 2;
      }
      ans -= m;
      return ans
  }
  function tobin(a) {
      let s = "";
      if (a == '0') {
          a = 0
      }
      if (a == '1') {
          a = 1
      }
      if (a == '2') {
          a = 2
      }
      if (a == '3') {
          a = 3
      }
      if (a == '4') {
          a = 4
      }
      if (a == '5') {
          a = 5
      }
      if (a == '6') {
          a = 6
      }
      if (a == '7') {
          a = 7
      }
      if (a == '8') {
          a = 8
      }
      if (a == '9') {
          a = 9
      }
      if (a == 'A') {
          a = 10;
      }
      if (a == 'B') {
          a = 11;
      }
      if (a == 'C') {
          a = 12;
      }
      if (a == 'D') {
          a = 13;
      }
      if (a == 'E') {
          a = 14;
      }
      if (a == 'F') {
          a = 15;
      }
  
      for (let i = 0; i < 4; i++) {
          let x = a % 2;
          // x.toString();
          s = s + x;
          a = Math.floor(a / 2);
      }
      // reverse(s);
      let s2 = "";
      let l = s.length;
      for (let i = 0; i < l; i++) {
          s2 = s[i] + s2
      }
      return s2;
  
  }
  let s = "";
  let l = a.length
  for (let i = 0; i < l; i++) {
      let s1 = tobin(a[i])
      console.log()
      s = s + s1
  }
  let opcode = ""
  for (let i = 25; i < 32; i++) {
      opcode = opcode + s[i]
  }
  
  if (opcode == "0110011") {
      let ret = { op: "", rd: 0, rs1: 0, rs2: 0,imm: 0 }
      let r = ""
      for (let i = 20; i < 25; i++) {
          r = r + s[i]
      }
      let fun3 = ""
  
      for (let i = 17; i < 20; i++) {
          fun3 = fun3 + s[i]
      }
  
      let r1 = ""
      for (let i = 12; i < 17; i++) {
          r1 = r1 + s[i]
      }
      let r2 = ""
      for (let i = 7; i < 12; i++) {
          r2 = r2 + s[i]
      }
  
      let fun7 = ""
      for (let i = 0; i < 7; i++) {
          fun7 = fun7 + s[i]
      }
      ret.rs1 = toint(r1)
      ret.rs2 = toint(r2)
      ret.rd = toint(r)
      if (fun3 == "000" && fun7 == "0000000") {
          ret.op = "add"
  
      }
      else if (fun3 == "000" && fun7 == "0100000") {
          ret.op = "sub"
      }
      else if (fun3 == "100" && fun7 == "0000000") {
          ret.op = "xor"
      }
      else if (fun3 == "110" && fun7 == "0000000") {
          ret.op = "or"
      }
      else if (fun3 == "111" && fun7 == "0000000") {
          ret.op = "and"
      }
      else if (fun3 == "001" && fun7 == "0000000") {
          ret.op = "sll"
      }
      else if (fun3 == "101" && fun7 == "0000000") {
          ret.op = "srl"
      }
      else if (fun3 == "101" && fun7 == "0100000") {
          ret.op = "sra"
      }
      else if (fun3 == "010" && fun7 == "0000000") {
          ret.op = "slt"
      }
      else if (fun3 == "011" && fun7 == "0000000") {
          ret.op = "sltu"
      }
  
      return ret
  }
  
  else if (opcode == "0010011") {
      let ret = { op: 0, rd: 0, rs1: 0, imm:0,rs2:0 }
      let r = ""
      for (let i = 20; i < 25; i++) {
          r = r + s[i]
      }
      let fun3 = ""
  
      for (let i = 17; i < 20; i++) {
          fun3 = fun3 + s[i]
      }
  
  
      let r1 = ""
      for (let i = 12; i < 17; i++) {
          r1 = r1 + s[i]
      }
  
      let imm = ""
      for (let i = 0; i < 12; i++) {
          imm = imm + s[i]
      }
  
      let fun7 = ""
      for (let i = 0; i < 7; i++) {
          fun7 += imm[i]
      }
  
      ret.rs1 = toint(r1)
      ret.rd = toint(r)
      if (imm[0] == 1) {
          ret.imm = negative(imm)
      }
      else {
          ret.imm = toint(imm)
  
      }
  
      if (fun3 == "000") {
          ret.op = "add"
  
      }
      else if (fun3 == "100") {
          ret.op = "xor"
      }
      else if (fun3 == "110") {
          ret.op = "or"
      }
      else if (fun3 == "111") {
          ret.op = "and"
      }
      else if (fun3 == "001" && fun7 == "0000000") {
          ret.op = "sll"
      }
      else if (fun3 == "101" && fun7 == "0000000") {
          ret.op = "srl"
      }
      else if (fun3 == "101" && fun7 == "0100000") {
          ret.op = "sra"
      }
      else if (fun3 == "010") {
          ret.op = "slt"
      }
      else if (fun3 == "011") {
          ret.op = "sltu"
      }
      ret.op = ret.op + 'i'
  
      return ret
  
  }
  else if (opcode == "0000011") {
      let ret = { op: "", rd: 0, rs1: 0, imm: 0,rs2:0}
      let r = ""
      for (let i = 20; i < 25; i++) {
          r = r + s[i]
      }
      // console.log("rd : " + toint(r))
      let fun3 = ""
  
      for (let i = 17; i < 20; i++) {
          fun3 = fun3 + s[i]
      }
  
      // console.log("fun3 : " + fun3)
  
      let r1 = ""
      for (let i = 12; i < 17; i++) {
          r1 = r1 + s[i]
      }
      // console.log("rs1 : "+toint(r1))
  
      let imm = ""
      for (let i = 0; i < 12; i++) {
          imm = imm + s[i]
      }
  
      // console.log("imm : "+toint(imm))
      ret.rs1 = toint(r1)
      ret.rd = toint(r)
      if (imm[0] == "1") {
  
          ret.imm = tnegative(imm)
      }
      else {
          ret.imm = toint(imm)
  
      }
  
      if (fun3 == "000") {
          ret.op = "lb"
      }
      else if (fun3 == "001") {
          ret.op = "lh"
      }
      else if (fun3 == "010") {
          ret.op = "lw"
      }
      else if (fun3 == "100") {
          ret.op = "lbu"
      }
      else if (fun3 == "101") {
          ret.op = "lhu"
      }
      return ret
  
  }
  else if (opcode == "0100011") {
      let ret = { op: "", rs1: 0, rs2: 0, imm: 0,rd:0 }
      let imm = ""
      for (let i = 0; i < 7; i++) {
          imm = imm + s[i]
      }
      for (let i = 20; i < 25; i++) {
          imm = imm + s[i]
      }
      let fun3 = ""
  
      for (let i = 17; i < 20; i++) {
          fun3 = fun3 + s[i]
      }
  
      // console.log("fun3 : " + fun3)
  
      let rs1 = ""
      for (let i = 12; i < 17; i++) {
          rs1 = rs1 + s[i]
      }
      // console.log("rs1 : "+toint(rs1))
  
      let rs2 = ""
      for (let i = 7; i < 12; i++) {
          rs2 = rs2 + s[i]
      }
  
      // console.log("rs2 : "+toint(rs2))
  
  
  
      // console.log("fun7 : "+fun7)
      // console.log("imm : " + toint(imm))
  
      ret.rs1 = toint(rs1)
      ret.rs2 = toint(rs2)
      if (imm[0] == "1") {
          ret.imm = negative(imm)
  
      }
      else {
          ret.imm = toint(imm)
  
      }
  
      if (fun3 == "000") {
          ret.op = "sb"
      }
      else if (fun3 == "001") {
          ret.op = "sh"
      }
      else if (fun3 == "010") {
          ret.op = "sw"
      }
  
      return ret
  
  }
  
  else if (opcode == "1100011") {
      let ret = { op: "", rs1:0, rs2: 0, imm: 0,rd:0 }
      let imm = ""
      imm = imm + s[0]
      imm = imm + s[24]
  
      for (let i = 1; i < 7; i++) {
          imm = imm + s[i]
      }
      for (let i = 20; i < 25; i++) {
          imm = imm + s[i]
      }
  
      let fun3 = ""
  
      for (let i = 17; i < 20; i++) {
          fun3 = fun3 + s[i]
      }
  
      // console.log("fun3 : " + fun3)
  
      let rs1 = ""
      for (let i = 12; i < 17; i++) {
          rs1 = rs1 + s[i]
      }
      // console.log("rs1 : "+toint(rs1))
  
      let rs2 = ""
      for (let i = 7; i < 12; i++) {
          rs2 = rs2 + s[i]
      }
  
      // console.log("rs2 : "+toint(rs2))
      // console.log("imm : " + toint(imm))
      ret.rs1 = toint(rs1)
      ret.rs2 = toint(rs2)
      if (imm[0] == "1") {
          ret.imm = negative(imm)
  
      }
      else {
          ret.imm = toint(imm)
  
      }
  
      if (fun3 == "000") {
          ret.op = "beq"
      }
      else if (fun3 == "001") {
          ret.op = "bne"
      }
      else if (fun3 == "100") {
          ret.op = "blt"
      }
      else if (fun3 == "101") {
          ret.op = "bge"
      }
      else if (fun3 == "110") {
          ret.op = "bltu"
      }
      else if (fun3 == "111") {
          ret.op = "bgeu"
      }
  
  
      return ret
  
      // console.log("fun7 : "+fun7)
  
  
  
  }
  else if (opcode == "0110111" || opcode == "0010111") {
      let ret = { op: 0, rd: 0, imm: 0,rs1:0,rs2:0 }
      let rd = ""
      for (let i = 20; i < 25; i++) {
          rd = rd + s[i]
      }
      // console.log("rd : " + toint(rd))
  
      let imm = ""
      for (let i = 0; i < 20; i++) {
          imm = imm + s[i]
      }
  
      // console.log("imm : "+toint(imm))
  
      ret.rd = toint(rd)
      if (imm[0] == "1") {
          ret.imm = negative(imm)
  
      }
      else {
          ret.imm = toint(imm)
  
      }
  
      if (opcode == "0010111") {
          ret.op = "auipc"
      }
      else {
          ret.op = "lui"
      }
  
      return ret
  
  }
  else if (opcode == "1101111") {
      let ret = { op: "", rd: 0, imm: 0,rs1:0,rs2:0}
      let rd = ""
      for (let i = 20; i < 25; i++) {
          rd = rd + s[i]
      }
      // console.log("rd : " + toint(rd))
  
      let imm = ""
      imm = imm + s[0]
      for (let i = 12; i < 20; i++) {
          imm = imm + s[i]
      }
      imm = imm + s[11]
      for (let i = 1; i < 11; i++) {
          imm = imm + s[i]
      }
      imm += '0'
  
      // console.log("imm : "+toint(imm))
  
      ret.rd = toint(rd)
      if (imm[0] == "1") {
          ret.imm = negative(imm)
  
      }
      else {
          ret.imm = toint(imm)
  
      }
      ret.op = "jal"
  
      return ret
  
  }
  else if (opcode == "1100111") {
      let ret = { op: "", rd: 0, rs1: 0, imm: 0,rd:0 }
      let r = ""
      for (let i = 20; i < 25; i++) {
          r = r + s[i]
      }
      // console.log("rd : " + toint(r))
      let fun3 = ""
  
      for (let i = 17; i < 20; i++) {
          fun3 = fun3 + s[i]
      }
  
      // console.log("fun3 : " + fun3)
  
      let r1 = ""
      for (let i = 12; i < 17; i++) {
          r1 = r1 + s[i]
      }
      // console.log("rs1 : "+toint(r1))
  
      let imm = ""
      for (let i = 0; i < 12; i++) {
          imm = imm + s[i]
      }
  
      // console.log("imm : "+toint(imm))
      let fun7 = ""
      for (let i = 0; i < 7; i++) {
          fun7 += imm[i]
      }
  
      ret.rs1 = toint(r1)
      ret.rd = toint(r)
      if (imm[0] == "1") {
          ret.imm = negative(imm)
  
      }
      else {
          ret.imm = toint(imm)
  
      }
  
      if (fun3 == "000") {
          ret.op = "jalr"
      }
  
      return ret
  }
  else if (opcode == "1110011") {
      let ret = { op: "", rd: 0, rs1: 0, imm:0 ,rs2: 0 }
      let r = ""
      for (let i = 20; i < 25; i++) {
          r = r + s[i]
      }
      // console.log("rd : " + toint(r))
      let fun3 = ""
  
      for (let i = 17; i < 20; i++) {
          fun3 = fun3 + s[i]
      }
  
      // console.log("fun3 : " + fun3)
  
      let r1 = ""
      for (let i = 12; i < 17; i++) {
          r1 = r1 + s[i]
      }
      // console.log("rs1 : "+toint(r1))
  
      let imm = ""
      for (let i = 0; i < 12; i++) {
          imm = imm + s[i]
      }
  
      // console.log("imm : "+toint(imm))
      let fun7 = ""
      for (let i = 0; i < 7; i++) {
          fun7 += imm[i]
      }
  
      ret.rs1 = toint(r1)
      ret.rd = toint(r)
      if (imm[0] == "1") {
          ret.imm = negative(imm)
  
      }
      else {
          ret.imm = toint(imm)
  
      }
      imm = toint(imm)
      if (fun3 = "000") {
          if (imm == 0) {
              ret.op = "ecall"
          }
          else if (imm == 1) {
              ret.op = "ebreak"
          }
      }
  
      return ret
  }
  
  
  
  }
  decode2("E3A0200A");