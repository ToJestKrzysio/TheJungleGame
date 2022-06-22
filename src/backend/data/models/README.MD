# Model description

### first model  
- Small input size (24,9,7)
- Max child selection policy
- CNN network architecture
- alpha = 0.5
- epsilon = 0.25
- C = 1.5
- train using current data and previous 10 iterations
----

### Second model
- Large input size (178,9,7)
- Max child selection policy
- CNN network architecture
- alpha = 0.5
- epsilon = 0.25
- C = 1.5
- train using current data and previous 10 iterations

### Simple model - likely trained on faulty data
- Small input size (24,9,7)
- Max child selection policy
- CNN network architecture
- alpha = 0.5
- epsilon = 0.25
- C = 1.5
- train using current data and previous 10 iterations

### Robust model
- small input size (24,9,7)
- Robust child selection policy
- CNN network architecture
- alpha = 0.5
- epsilon = 0.25
- C = 1.5
- train using current data and previous 10 iterations

### Robust Single model
- small input size (24,9,7)
- Robust child selection policy
- CNN network architecture
- alpha = 0.5
- epsilon = 0.25
- C = 1.5
- train using only data generated in current step
