function values = ...
  ExecuteProgram(chromosome, numberOfVRegisters, constantRegisters, inputs)

  values               = zeros(1,length(inputs));
  chrom                = chromosome.Chromosome;
  numberOfInstructions = length(chrom) / 4;

  for i = 1:length(inputs)

    registers    = zeros(1,numberOfVRegisters);
    registers    = [registers constantRegisters];
    registers(1) = inputs(i);

    for j = 1:numberOfInstructions
      index = (j - 1) * 4 + 1;

      operation = chrom(index);
      output    = chrom(index + 1);
      operand1  = chrom(index + 2);
      operand2  = chrom(index + 3);

      switch operation
        case 1 % addition
          registers(output) = registers(operand1) + registers(operand2);
        case 2 % subtraction
          registers(output) = registers(operand1) - registers(operand2);
        case 3 % multiplication
          registers(output) = registers(operand1) * registers(operand2);
        case 4 % division
          if registers(operand2) == 0
            registers(output) = intmax;
          else
            registers(output) = registers(operand1) / registers(operand2);
          end
      end

    end

    values(i) = registers(1);

  end

end

