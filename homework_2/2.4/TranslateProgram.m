% Prints a program as readable operations
function TranslateProgram(chromosome, numberOfVRegisters, constants)

  prog                  = chromosome.Chromosome;

  for i = 1:length(prog) / 4
    instr = (i - 1) * 4 + 1;

    if prog(instr) == 1
      operation = '+';
    elseif prog(instr) == 2
      operation = '-';
    elseif prog(instr) == 3
      operation = '*';
    else
      operation = '/';
    end

    tmp = int2str(prog(instr + 1));
    result = strcat('r', tmp);

    tmp = prog(instr + 2);
    if tmp <= numberOfVRegisters
      op1 = strcat('r', int2str(tmp));
    else
      % Get the correct constant
      tmp = tmp - numberOfVRegisters;
      tmp = constants(tmp);

      op1 = int2str(tmp);
    end

    tmp = prog(instr + 3);
    if tmp <= numberOfVRegisters
      op2 = strcat('r', int2str(tmp));
    else
      % Get the correct constant
      tmp = tmp - numberOfVRegisters;
      tmp = constants(tmp);

      op2 = int2str(tmp);
    end

    output = strcat(result, ' = ', op1, operation, op2);
    disp(output);

  end
end
