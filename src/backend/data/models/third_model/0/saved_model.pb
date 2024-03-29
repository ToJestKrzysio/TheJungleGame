��:
��
D
AddV2
x"T
y"T
z"T"
Ttype:
2	��
B
AssignVariableOp
resource
value"dtype"
dtypetype�
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
�
Conv2D

input"T
filter"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

�
FusedBatchNormV3
x"T

scale"U
offset"U	
mean"U
variance"U
y"T

batch_mean"U
batch_variance"U
reserve_space_1"U
reserve_space_2"U
reserve_space_3"U"
Ttype:
2"
Utype:
2"
epsilonfloat%��8"&
exponential_avg_factorfloat%  �?";
data_formatstringNHWC:
NHWCNCHWNDHWCNCDHW"
is_trainingbool(
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(�
?
Mul
x"T
y"T
z"T"
Ttype:
2	�

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype�
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
.
Rsqrt
x"T
y"T"
Ttype:

2
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
?
Select
	condition

t"T
e"T
output"T"	
Ttype
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
�
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ��
@
StaticRegexFullMatch	
input

output
"
patternstring
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
<
Sub
x"T
y"T
z"T"
Ttype:
2	
-
Tanh
x"T
y"T"
Ttype:

2
�
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 �"serve*2.7.02v2.7.0-rc1-69-gc256c071bb28��5
�
Convolutional_Layer_0/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:�*-
shared_nameConvolutional_Layer_0/kernel
�
0Convolutional_Layer_0/kernel/Read/ReadVariableOpReadVariableOpConvolutional_Layer_0/kernel*'
_output_shapes
:�*
dtype0
�
Convolutional_Layer_0/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*+
shared_nameConvolutional_Layer_0/bias
�
.Convolutional_Layer_0/bias/Read/ReadVariableOpReadVariableOpConvolutional_Layer_0/bias*
_output_shapes
:*
dtype0
�
Batch_Normalization_0/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*,
shared_nameBatch_Normalization_0/gamma
�
/Batch_Normalization_0/gamma/Read/ReadVariableOpReadVariableOpBatch_Normalization_0/gamma*
_output_shapes
:*
dtype0
�
Batch_Normalization_0/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*+
shared_nameBatch_Normalization_0/beta
�
.Batch_Normalization_0/beta/Read/ReadVariableOpReadVariableOpBatch_Normalization_0/beta*
_output_shapes
:*
dtype0
�
!Batch_Normalization_0/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!Batch_Normalization_0/moving_mean
�
5Batch_Normalization_0/moving_mean/Read/ReadVariableOpReadVariableOp!Batch_Normalization_0/moving_mean*
_output_shapes
:*
dtype0
�
%Batch_Normalization_0/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*6
shared_name'%Batch_Normalization_0/moving_variance
�
9Batch_Normalization_0/moving_variance/Read/ReadVariableOpReadVariableOp%Batch_Normalization_0/moving_variance*
_output_shapes
:*
dtype0
�
Convolutional_Layer_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_nameConvolutional_Layer_1/kernel
�
0Convolutional_Layer_1/kernel/Read/ReadVariableOpReadVariableOpConvolutional_Layer_1/kernel*&
_output_shapes
:*
dtype0
�
Convolutional_Layer_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*+
shared_nameConvolutional_Layer_1/bias
�
.Convolutional_Layer_1/bias/Read/ReadVariableOpReadVariableOpConvolutional_Layer_1/bias*
_output_shapes
:*
dtype0
�
Batch_Normalization_1/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*,
shared_nameBatch_Normalization_1/gamma
�
/Batch_Normalization_1/gamma/Read/ReadVariableOpReadVariableOpBatch_Normalization_1/gamma*
_output_shapes
:*
dtype0
�
Batch_Normalization_1/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*+
shared_nameBatch_Normalization_1/beta
�
.Batch_Normalization_1/beta/Read/ReadVariableOpReadVariableOpBatch_Normalization_1/beta*
_output_shapes
:*
dtype0
�
!Batch_Normalization_1/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!Batch_Normalization_1/moving_mean
�
5Batch_Normalization_1/moving_mean/Read/ReadVariableOpReadVariableOp!Batch_Normalization_1/moving_mean*
_output_shapes
:*
dtype0
�
%Batch_Normalization_1/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*6
shared_name'%Batch_Normalization_1/moving_variance
�
9Batch_Normalization_1/moving_variance/Read/ReadVariableOpReadVariableOp%Batch_Normalization_1/moving_variance*
_output_shapes
:*
dtype0
�
Convolutional_Layer_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_nameConvolutional_Layer_2/kernel
�
0Convolutional_Layer_2/kernel/Read/ReadVariableOpReadVariableOpConvolutional_Layer_2/kernel*&
_output_shapes
:*
dtype0
�
Convolutional_Layer_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*+
shared_nameConvolutional_Layer_2/bias
�
.Convolutional_Layer_2/bias/Read/ReadVariableOpReadVariableOpConvolutional_Layer_2/bias*
_output_shapes
:*
dtype0
�
Batch_Normalization_2/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*,
shared_nameBatch_Normalization_2/gamma
�
/Batch_Normalization_2/gamma/Read/ReadVariableOpReadVariableOpBatch_Normalization_2/gamma*
_output_shapes
:*
dtype0
�
Batch_Normalization_2/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*+
shared_nameBatch_Normalization_2/beta
�
.Batch_Normalization_2/beta/Read/ReadVariableOpReadVariableOpBatch_Normalization_2/beta*
_output_shapes
:*
dtype0
�
!Batch_Normalization_2/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!Batch_Normalization_2/moving_mean
�
5Batch_Normalization_2/moving_mean/Read/ReadVariableOpReadVariableOp!Batch_Normalization_2/moving_mean*
_output_shapes
:*
dtype0
�
%Batch_Normalization_2/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*6
shared_name'%Batch_Normalization_2/moving_variance
�
9Batch_Normalization_2/moving_variance/Read/ReadVariableOpReadVariableOp%Batch_Normalization_2/moving_variance*
_output_shapes
:*
dtype0
�
Convolutional_Layer_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_nameConvolutional_Layer_3/kernel
�
0Convolutional_Layer_3/kernel/Read/ReadVariableOpReadVariableOpConvolutional_Layer_3/kernel*&
_output_shapes
:*
dtype0
�
Convolutional_Layer_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*+
shared_nameConvolutional_Layer_3/bias
�
.Convolutional_Layer_3/bias/Read/ReadVariableOpReadVariableOpConvolutional_Layer_3/bias*
_output_shapes
:*
dtype0
�
Batch_Normalization_3/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*,
shared_nameBatch_Normalization_3/gamma
�
/Batch_Normalization_3/gamma/Read/ReadVariableOpReadVariableOpBatch_Normalization_3/gamma*
_output_shapes
:*
dtype0
�
Batch_Normalization_3/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*+
shared_nameBatch_Normalization_3/beta
�
.Batch_Normalization_3/beta/Read/ReadVariableOpReadVariableOpBatch_Normalization_3/beta*
_output_shapes
:*
dtype0
�
!Batch_Normalization_3/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!Batch_Normalization_3/moving_mean
�
5Batch_Normalization_3/moving_mean/Read/ReadVariableOpReadVariableOp!Batch_Normalization_3/moving_mean*
_output_shapes
:*
dtype0
�
%Batch_Normalization_3/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*6
shared_name'%Batch_Normalization_3/moving_variance
�
9Batch_Normalization_3/moving_variance/Read/ReadVariableOpReadVariableOp%Batch_Normalization_3/moving_variance*
_output_shapes
:*
dtype0
�
Convolutional_Layer_4/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_nameConvolutional_Layer_4/kernel
�
0Convolutional_Layer_4/kernel/Read/ReadVariableOpReadVariableOpConvolutional_Layer_4/kernel*&
_output_shapes
:*
dtype0
�
Convolutional_Layer_4/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*+
shared_nameConvolutional_Layer_4/bias
�
.Convolutional_Layer_4/bias/Read/ReadVariableOpReadVariableOpConvolutional_Layer_4/bias*
_output_shapes
:*
dtype0
�
Batch_Normalization_4/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*,
shared_nameBatch_Normalization_4/gamma
�
/Batch_Normalization_4/gamma/Read/ReadVariableOpReadVariableOpBatch_Normalization_4/gamma*
_output_shapes
:*
dtype0
�
Batch_Normalization_4/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*+
shared_nameBatch_Normalization_4/beta
�
.Batch_Normalization_4/beta/Read/ReadVariableOpReadVariableOpBatch_Normalization_4/beta*
_output_shapes
:*
dtype0
�
!Batch_Normalization_4/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!Batch_Normalization_4/moving_mean
�
5Batch_Normalization_4/moving_mean/Read/ReadVariableOpReadVariableOp!Batch_Normalization_4/moving_mean*
_output_shapes
:*
dtype0
�
%Batch_Normalization_4/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*6
shared_name'%Batch_Normalization_4/moving_variance
�
9Batch_Normalization_4/moving_variance/Read/ReadVariableOpReadVariableOp%Batch_Normalization_4/moving_variance*
_output_shapes
:*
dtype0
�
Convolutional_Layer_5/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_nameConvolutional_Layer_5/kernel
�
0Convolutional_Layer_5/kernel/Read/ReadVariableOpReadVariableOpConvolutional_Layer_5/kernel*&
_output_shapes
:*
dtype0
�
Convolutional_Layer_5/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*+
shared_nameConvolutional_Layer_5/bias
�
.Convolutional_Layer_5/bias/Read/ReadVariableOpReadVariableOpConvolutional_Layer_5/bias*
_output_shapes
:*
dtype0
�
Batch_Normalization_5/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*,
shared_nameBatch_Normalization_5/gamma
�
/Batch_Normalization_5/gamma/Read/ReadVariableOpReadVariableOpBatch_Normalization_5/gamma*
_output_shapes
:*
dtype0
�
Batch_Normalization_5/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*+
shared_nameBatch_Normalization_5/beta
�
.Batch_Normalization_5/beta/Read/ReadVariableOpReadVariableOpBatch_Normalization_5/beta*
_output_shapes
:*
dtype0
�
!Batch_Normalization_5/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!Batch_Normalization_5/moving_mean
�
5Batch_Normalization_5/moving_mean/Read/ReadVariableOpReadVariableOp!Batch_Normalization_5/moving_mean*
_output_shapes
:*
dtype0
�
%Batch_Normalization_5/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*6
shared_name'%Batch_Normalization_5/moving_variance
�
9Batch_Normalization_5/moving_variance/Read/ReadVariableOpReadVariableOp%Batch_Normalization_5/moving_variance*
_output_shapes
:*
dtype0
�
 Value_Convolutional_Layer/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*1
shared_name" Value_Convolutional_Layer/kernel
�
4Value_Convolutional_Layer/kernel/Read/ReadVariableOpReadVariableOp Value_Convolutional_Layer/kernel*&
_output_shapes
:*
dtype0
�
Value_Convolutional_Layer/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*/
shared_name Value_Convolutional_Layer/bias
�
2Value_Convolutional_Layer/bias/Read/ReadVariableOpReadVariableOpValue_Convolutional_Layer/bias*
_output_shapes
:*
dtype0
�
#Policy_Convolutional_Layer_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*4
shared_name%#Policy_Convolutional_Layer_1/kernel
�
7Policy_Convolutional_Layer_1/kernel/Read/ReadVariableOpReadVariableOp#Policy_Convolutional_Layer_1/kernel*&
_output_shapes
:*
dtype0
�
!Policy_Convolutional_Layer_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!Policy_Convolutional_Layer_1/bias
�
5Policy_Convolutional_Layer_1/bias/Read/ReadVariableOpReadVariableOp!Policy_Convolutional_Layer_1/bias*
_output_shapes
:*
dtype0
�
!Value_Batch_Normalization_1/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!Value_Batch_Normalization_1/gamma
�
5Value_Batch_Normalization_1/gamma/Read/ReadVariableOpReadVariableOp!Value_Batch_Normalization_1/gamma*
_output_shapes
:*
dtype0
�
 Value_Batch_Normalization_1/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*1
shared_name" Value_Batch_Normalization_1/beta
�
4Value_Batch_Normalization_1/beta/Read/ReadVariableOpReadVariableOp Value_Batch_Normalization_1/beta*
_output_shapes
:*
dtype0
�
'Value_Batch_Normalization_1/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*8
shared_name)'Value_Batch_Normalization_1/moving_mean
�
;Value_Batch_Normalization_1/moving_mean/Read/ReadVariableOpReadVariableOp'Value_Batch_Normalization_1/moving_mean*
_output_shapes
:*
dtype0
�
+Value_Batch_Normalization_1/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*<
shared_name-+Value_Batch_Normalization_1/moving_variance
�
?Value_Batch_Normalization_1/moving_variance/Read/ReadVariableOpReadVariableOp+Value_Batch_Normalization_1/moving_variance*
_output_shapes
:*
dtype0
�
"Policy_Batch_Normalization_1/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*3
shared_name$"Policy_Batch_Normalization_1/gamma
�
6Policy_Batch_Normalization_1/gamma/Read/ReadVariableOpReadVariableOp"Policy_Batch_Normalization_1/gamma*
_output_shapes
:*
dtype0
�
!Policy_Batch_Normalization_1/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!Policy_Batch_Normalization_1/beta
�
5Policy_Batch_Normalization_1/beta/Read/ReadVariableOpReadVariableOp!Policy_Batch_Normalization_1/beta*
_output_shapes
:*
dtype0
�
(Policy_Batch_Normalization_1/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*9
shared_name*(Policy_Batch_Normalization_1/moving_mean
�
<Policy_Batch_Normalization_1/moving_mean/Read/ReadVariableOpReadVariableOp(Policy_Batch_Normalization_1/moving_mean*
_output_shapes
:*
dtype0
�
,Policy_Batch_Normalization_1/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*=
shared_name.,Policy_Batch_Normalization_1/moving_variance
�
@Policy_Batch_Normalization_1/moving_variance/Read/ReadVariableOpReadVariableOp,Policy_Batch_Normalization_1/moving_variance*
_output_shapes
:*
dtype0
�
#Policy_Convolutional_Layer_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*4
shared_name%#Policy_Convolutional_Layer_2/kernel
�
7Policy_Convolutional_Layer_2/kernel/Read/ReadVariableOpReadVariableOp#Policy_Convolutional_Layer_2/kernel*&
_output_shapes
:*
dtype0
�
!Policy_Convolutional_Layer_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!Policy_Convolutional_Layer_2/bias
�
5Policy_Convolutional_Layer_2/bias/Read/ReadVariableOpReadVariableOp!Policy_Convolutional_Layer_2/bias*
_output_shapes
:*
dtype0
�
Value_Dense_Layer/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:?@*)
shared_nameValue_Dense_Layer/kernel
�
,Value_Dense_Layer/kernel/Read/ReadVariableOpReadVariableOpValue_Dense_Layer/kernel*
_output_shapes

:?@*
dtype0
�
Value_Dense_Layer/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*'
shared_nameValue_Dense_Layer/bias
}
*Value_Dense_Layer/bias/Read/ReadVariableOpReadVariableOpValue_Dense_Layer/bias*
_output_shapes
:@*
dtype0
�
"Policy_Batch_Normalization_2/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*3
shared_name$"Policy_Batch_Normalization_2/gamma
�
6Policy_Batch_Normalization_2/gamma/Read/ReadVariableOpReadVariableOp"Policy_Batch_Normalization_2/gamma*
_output_shapes
:*
dtype0
�
!Policy_Batch_Normalization_2/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!Policy_Batch_Normalization_2/beta
�
5Policy_Batch_Normalization_2/beta/Read/ReadVariableOpReadVariableOp!Policy_Batch_Normalization_2/beta*
_output_shapes
:*
dtype0
�
(Policy_Batch_Normalization_2/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*9
shared_name*(Policy_Batch_Normalization_2/moving_mean
�
<Policy_Batch_Normalization_2/moving_mean/Read/ReadVariableOpReadVariableOp(Policy_Batch_Normalization_2/moving_mean*
_output_shapes
:*
dtype0
�
,Policy_Batch_Normalization_2/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*=
shared_name.,Policy_Batch_Normalization_2/moving_variance
�
@Policy_Batch_Normalization_2/moving_variance/Read/ReadVariableOpReadVariableOp,Policy_Batch_Normalization_2/moving_variance*
_output_shapes
:*
dtype0
�
!Value_Batch_Normalization_2/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*2
shared_name#!Value_Batch_Normalization_2/gamma
�
5Value_Batch_Normalization_2/gamma/Read/ReadVariableOpReadVariableOp!Value_Batch_Normalization_2/gamma*
_output_shapes
:@*
dtype0
�
 Value_Batch_Normalization_2/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*1
shared_name" Value_Batch_Normalization_2/beta
�
4Value_Batch_Normalization_2/beta/Read/ReadVariableOpReadVariableOp Value_Batch_Normalization_2/beta*
_output_shapes
:@*
dtype0
�
'Value_Batch_Normalization_2/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*8
shared_name)'Value_Batch_Normalization_2/moving_mean
�
;Value_Batch_Normalization_2/moving_mean/Read/ReadVariableOpReadVariableOp'Value_Batch_Normalization_2/moving_mean*
_output_shapes
:@*
dtype0
�
+Value_Batch_Normalization_2/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*<
shared_name-+Value_Batch_Normalization_2/moving_variance
�
?Value_Batch_Normalization_2/moving_variance/Read/ReadVariableOpReadVariableOp+Value_Batch_Normalization_2/moving_variance*
_output_shapes
:@*
dtype0
~
Value_Head/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*"
shared_nameValue_Head/kernel
w
%Value_Head/kernel/Read/ReadVariableOpReadVariableOpValue_Head/kernel*
_output_shapes

:@*
dtype0
v
Value_Head/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:* 
shared_nameValue_Head/bias
o
#Value_Head/bias/Read/ReadVariableOpReadVariableOpValue_Head/bias*
_output_shapes
:*
dtype0
�
Policy_Head/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?�*#
shared_namePolicy_Head/kernel
z
&Policy_Head/kernel/Read/ReadVariableOpReadVariableOpPolicy_Head/kernel*
_output_shapes
:	?�*
dtype0
y
Policy_Head/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:�*!
shared_namePolicy_Head/bias
r
$Policy_Head/bias/Read/ReadVariableOpReadVariableOpPolicy_Head/bias*
_output_shapes	
:�*
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
b
total_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	total_1
[
total_1/Read/ReadVariableOpReadVariableOptotal_1*
_output_shapes
: *
dtype0
b
count_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	count_1
[
count_1/Read/ReadVariableOpReadVariableOpcount_1*
_output_shapes
: *
dtype0
b
total_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	total_2
[
total_2/Read/ReadVariableOpReadVariableOptotal_2*
_output_shapes
: *
dtype0
b
count_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	count_2
[
count_2/Read/ReadVariableOpReadVariableOpcount_2*
_output_shapes
: *
dtype0

NoOpNoOp
��
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*��
value�B� Bݕ
�
layer-0
layer_with_weights-0
layer-1
layer_with_weights-1
layer-2
layer_with_weights-2
layer-3
layer_with_weights-3
layer-4
layer_with_weights-4
layer-5
layer_with_weights-5
layer-6
layer_with_weights-6
layer-7
	layer_with_weights-7
	layer-8

layer_with_weights-8

layer-9
layer_with_weights-9
layer-10
layer_with_weights-10
layer-11
layer_with_weights-11
layer-12
layer_with_weights-12
layer-13
layer_with_weights-13
layer-14
layer_with_weights-14
layer-15
layer_with_weights-15
layer-16
layer-17
layer_with_weights-16
layer-18
layer_with_weights-17
layer-19
layer_with_weights-18
layer-20
layer_with_weights-19
layer-21
layer-22
layer_with_weights-20
layer-23
layer_with_weights-21
layer-24
	optimizer
loss
	variables
trainable_variables
regularization_losses
	keras_api
 
signatures
 
h

!kernel
"bias
#	variables
$trainable_variables
%regularization_losses
&	keras_api
�
'axis
	(gamma
)beta
*moving_mean
+moving_variance
,	variables
-trainable_variables
.regularization_losses
/	keras_api
h

0kernel
1bias
2	variables
3trainable_variables
4regularization_losses
5	keras_api
�
6axis
	7gamma
8beta
9moving_mean
:moving_variance
;	variables
<trainable_variables
=regularization_losses
>	keras_api
h

?kernel
@bias
A	variables
Btrainable_variables
Cregularization_losses
D	keras_api
�
Eaxis
	Fgamma
Gbeta
Hmoving_mean
Imoving_variance
J	variables
Ktrainable_variables
Lregularization_losses
M	keras_api
h

Nkernel
Obias
P	variables
Qtrainable_variables
Rregularization_losses
S	keras_api
�
Taxis
	Ugamma
Vbeta
Wmoving_mean
Xmoving_variance
Y	variables
Ztrainable_variables
[regularization_losses
\	keras_api
h

]kernel
^bias
_	variables
`trainable_variables
aregularization_losses
b	keras_api
�
caxis
	dgamma
ebeta
fmoving_mean
gmoving_variance
h	variables
itrainable_variables
jregularization_losses
k	keras_api
h

lkernel
mbias
n	variables
otrainable_variables
pregularization_losses
q	keras_api
�
raxis
	sgamma
tbeta
umoving_mean
vmoving_variance
w	variables
xtrainable_variables
yregularization_losses
z	keras_api
i

{kernel
|bias
}	variables
~trainable_variables
regularization_losses
�	keras_api
n
�kernel
	�bias
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�
	�axis

�gamma
	�beta
�moving_mean
�moving_variance
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�
	�axis

�gamma
	�beta
�moving_mean
�moving_variance
�	variables
�trainable_variables
�regularization_losses
�	keras_api
V
�	variables
�trainable_variables
�regularization_losses
�	keras_api
n
�kernel
	�bias
�	variables
�trainable_variables
�regularization_losses
�	keras_api
n
�kernel
	�bias
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�
	�axis

�gamma
	�beta
�moving_mean
�moving_variance
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�
	�axis

�gamma
	�beta
�moving_mean
�moving_variance
�	variables
�trainable_variables
�regularization_losses
�	keras_api
V
�	variables
�trainable_variables
�regularization_losses
�	keras_api
n
�kernel
	�bias
�	variables
�trainable_variables
�regularization_losses
�	keras_api
n
�kernel
	�bias
�	variables
�trainable_variables
�regularization_losses
�	keras_api
 
 
�
!0
"1
(2
)3
*4
+5
06
17
78
89
910
:11
?12
@13
F14
G15
H16
I17
N18
O19
U20
V21
W22
X23
]24
^25
d26
e27
f28
g29
l30
m31
s32
t33
u34
v35
{36
|37
�38
�39
�40
�41
�42
�43
�44
�45
�46
�47
�48
�49
�50
�51
�52
�53
�54
�55
�56
�57
�58
�59
�60
�61
�62
�63
�
!0
"1
(2
)3
04
15
76
87
?8
@9
F10
G11
N12
O13
U14
V15
]16
^17
d18
e19
l20
m21
s22
t23
{24
|25
�26
�27
�28
�29
�30
�31
�32
�33
�34
�35
�36
�37
�38
�39
�40
�41
�42
�43
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
	variables
trainable_variables
regularization_losses
 
hf
VARIABLE_VALUEConvolutional_Layer_0/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE
db
VARIABLE_VALUEConvolutional_Layer_0/bias4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE

!0
"1

!0
"1
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
#	variables
$trainable_variables
%regularization_losses
 
fd
VARIABLE_VALUEBatch_Normalization_0/gamma5layer_with_weights-1/gamma/.ATTRIBUTES/VARIABLE_VALUE
db
VARIABLE_VALUEBatch_Normalization_0/beta4layer_with_weights-1/beta/.ATTRIBUTES/VARIABLE_VALUE
rp
VARIABLE_VALUE!Batch_Normalization_0/moving_mean;layer_with_weights-1/moving_mean/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUE%Batch_Normalization_0/moving_variance?layer_with_weights-1/moving_variance/.ATTRIBUTES/VARIABLE_VALUE

(0
)1
*2
+3

(0
)1
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
,	variables
-trainable_variables
.regularization_losses
hf
VARIABLE_VALUEConvolutional_Layer_1/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE
db
VARIABLE_VALUEConvolutional_Layer_1/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE

00
11

00
11
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
2	variables
3trainable_variables
4regularization_losses
 
fd
VARIABLE_VALUEBatch_Normalization_1/gamma5layer_with_weights-3/gamma/.ATTRIBUTES/VARIABLE_VALUE
db
VARIABLE_VALUEBatch_Normalization_1/beta4layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUE
rp
VARIABLE_VALUE!Batch_Normalization_1/moving_mean;layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUE%Batch_Normalization_1/moving_variance?layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUE

70
81
92
:3

70
81
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
;	variables
<trainable_variables
=regularization_losses
hf
VARIABLE_VALUEConvolutional_Layer_2/kernel6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUE
db
VARIABLE_VALUEConvolutional_Layer_2/bias4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUE

?0
@1

?0
@1
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
A	variables
Btrainable_variables
Cregularization_losses
 
fd
VARIABLE_VALUEBatch_Normalization_2/gamma5layer_with_weights-5/gamma/.ATTRIBUTES/VARIABLE_VALUE
db
VARIABLE_VALUEBatch_Normalization_2/beta4layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUE
rp
VARIABLE_VALUE!Batch_Normalization_2/moving_mean;layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUE%Batch_Normalization_2/moving_variance?layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUE

F0
G1
H2
I3

F0
G1
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
J	variables
Ktrainable_variables
Lregularization_losses
hf
VARIABLE_VALUEConvolutional_Layer_3/kernel6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUE
db
VARIABLE_VALUEConvolutional_Layer_3/bias4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUE

N0
O1

N0
O1
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
P	variables
Qtrainable_variables
Rregularization_losses
 
fd
VARIABLE_VALUEBatch_Normalization_3/gamma5layer_with_weights-7/gamma/.ATTRIBUTES/VARIABLE_VALUE
db
VARIABLE_VALUEBatch_Normalization_3/beta4layer_with_weights-7/beta/.ATTRIBUTES/VARIABLE_VALUE
rp
VARIABLE_VALUE!Batch_Normalization_3/moving_mean;layer_with_weights-7/moving_mean/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUE%Batch_Normalization_3/moving_variance?layer_with_weights-7/moving_variance/.ATTRIBUTES/VARIABLE_VALUE

U0
V1
W2
X3

U0
V1
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
Y	variables
Ztrainable_variables
[regularization_losses
hf
VARIABLE_VALUEConvolutional_Layer_4/kernel6layer_with_weights-8/kernel/.ATTRIBUTES/VARIABLE_VALUE
db
VARIABLE_VALUEConvolutional_Layer_4/bias4layer_with_weights-8/bias/.ATTRIBUTES/VARIABLE_VALUE

]0
^1

]0
^1
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
_	variables
`trainable_variables
aregularization_losses
 
fd
VARIABLE_VALUEBatch_Normalization_4/gamma5layer_with_weights-9/gamma/.ATTRIBUTES/VARIABLE_VALUE
db
VARIABLE_VALUEBatch_Normalization_4/beta4layer_with_weights-9/beta/.ATTRIBUTES/VARIABLE_VALUE
rp
VARIABLE_VALUE!Batch_Normalization_4/moving_mean;layer_with_weights-9/moving_mean/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUE%Batch_Normalization_4/moving_variance?layer_with_weights-9/moving_variance/.ATTRIBUTES/VARIABLE_VALUE

d0
e1
f2
g3

d0
e1
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
h	variables
itrainable_variables
jregularization_losses
ig
VARIABLE_VALUEConvolutional_Layer_5/kernel7layer_with_weights-10/kernel/.ATTRIBUTES/VARIABLE_VALUE
ec
VARIABLE_VALUEConvolutional_Layer_5/bias5layer_with_weights-10/bias/.ATTRIBUTES/VARIABLE_VALUE

l0
m1

l0
m1
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
n	variables
otrainable_variables
pregularization_losses
 
ge
VARIABLE_VALUEBatch_Normalization_5/gamma6layer_with_weights-11/gamma/.ATTRIBUTES/VARIABLE_VALUE
ec
VARIABLE_VALUEBatch_Normalization_5/beta5layer_with_weights-11/beta/.ATTRIBUTES/VARIABLE_VALUE
sq
VARIABLE_VALUE!Batch_Normalization_5/moving_mean<layer_with_weights-11/moving_mean/.ATTRIBUTES/VARIABLE_VALUE
{y
VARIABLE_VALUE%Batch_Normalization_5/moving_variance@layer_with_weights-11/moving_variance/.ATTRIBUTES/VARIABLE_VALUE

s0
t1
u2
v3

s0
t1
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
w	variables
xtrainable_variables
yregularization_losses
mk
VARIABLE_VALUE Value_Convolutional_Layer/kernel7layer_with_weights-12/kernel/.ATTRIBUTES/VARIABLE_VALUE
ig
VARIABLE_VALUEValue_Convolutional_Layer/bias5layer_with_weights-12/bias/.ATTRIBUTES/VARIABLE_VALUE

{0
|1

{0
|1
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
}	variables
~trainable_variables
regularization_losses
pn
VARIABLE_VALUE#Policy_Convolutional_Layer_1/kernel7layer_with_weights-13/kernel/.ATTRIBUTES/VARIABLE_VALUE
lj
VARIABLE_VALUE!Policy_Convolutional_Layer_1/bias5layer_with_weights-13/bias/.ATTRIBUTES/VARIABLE_VALUE

�0
�1

�0
�1
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
 
mk
VARIABLE_VALUE!Value_Batch_Normalization_1/gamma6layer_with_weights-14/gamma/.ATTRIBUTES/VARIABLE_VALUE
ki
VARIABLE_VALUE Value_Batch_Normalization_1/beta5layer_with_weights-14/beta/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUE'Value_Batch_Normalization_1/moving_mean<layer_with_weights-14/moving_mean/.ATTRIBUTES/VARIABLE_VALUE
�
VARIABLE_VALUE+Value_Batch_Normalization_1/moving_variance@layer_with_weights-14/moving_variance/.ATTRIBUTES/VARIABLE_VALUE
 
�0
�1
�2
�3

�0
�1
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
 
nl
VARIABLE_VALUE"Policy_Batch_Normalization_1/gamma6layer_with_weights-15/gamma/.ATTRIBUTES/VARIABLE_VALUE
lj
VARIABLE_VALUE!Policy_Batch_Normalization_1/beta5layer_with_weights-15/beta/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUE(Policy_Batch_Normalization_1/moving_mean<layer_with_weights-15/moving_mean/.ATTRIBUTES/VARIABLE_VALUE
��
VARIABLE_VALUE,Policy_Batch_Normalization_1/moving_variance@layer_with_weights-15/moving_variance/.ATTRIBUTES/VARIABLE_VALUE
 
�0
�1
�2
�3

�0
�1
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
 
 
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
pn
VARIABLE_VALUE#Policy_Convolutional_Layer_2/kernel7layer_with_weights-16/kernel/.ATTRIBUTES/VARIABLE_VALUE
lj
VARIABLE_VALUE!Policy_Convolutional_Layer_2/bias5layer_with_weights-16/bias/.ATTRIBUTES/VARIABLE_VALUE

�0
�1

�0
�1
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
ec
VARIABLE_VALUEValue_Dense_Layer/kernel7layer_with_weights-17/kernel/.ATTRIBUTES/VARIABLE_VALUE
a_
VARIABLE_VALUEValue_Dense_Layer/bias5layer_with_weights-17/bias/.ATTRIBUTES/VARIABLE_VALUE

�0
�1

�0
�1
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
 
nl
VARIABLE_VALUE"Policy_Batch_Normalization_2/gamma6layer_with_weights-18/gamma/.ATTRIBUTES/VARIABLE_VALUE
lj
VARIABLE_VALUE!Policy_Batch_Normalization_2/beta5layer_with_weights-18/beta/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUE(Policy_Batch_Normalization_2/moving_mean<layer_with_weights-18/moving_mean/.ATTRIBUTES/VARIABLE_VALUE
��
VARIABLE_VALUE,Policy_Batch_Normalization_2/moving_variance@layer_with_weights-18/moving_variance/.ATTRIBUTES/VARIABLE_VALUE
 
�0
�1
�2
�3

�0
�1
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
 
mk
VARIABLE_VALUE!Value_Batch_Normalization_2/gamma6layer_with_weights-19/gamma/.ATTRIBUTES/VARIABLE_VALUE
ki
VARIABLE_VALUE Value_Batch_Normalization_2/beta5layer_with_weights-19/beta/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUE'Value_Batch_Normalization_2/moving_mean<layer_with_weights-19/moving_mean/.ATTRIBUTES/VARIABLE_VALUE
�
VARIABLE_VALUE+Value_Batch_Normalization_2/moving_variance@layer_with_weights-19/moving_variance/.ATTRIBUTES/VARIABLE_VALUE
 
�0
�1
�2
�3

�0
�1
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
 
 
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
^\
VARIABLE_VALUEValue_Head/kernel7layer_with_weights-20/kernel/.ATTRIBUTES/VARIABLE_VALUE
ZX
VARIABLE_VALUEValue_Head/bias5layer_with_weights-20/bias/.ATTRIBUTES/VARIABLE_VALUE

�0
�1

�0
�1
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
_]
VARIABLE_VALUEPolicy_Head/kernel7layer_with_weights-21/kernel/.ATTRIBUTES/VARIABLE_VALUE
[Y
VARIABLE_VALUEPolicy_Head/bias5layer_with_weights-21/bias/.ATTRIBUTES/VARIABLE_VALUE

�0
�1

�0
�1
 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�
*0
+1
92
:3
H4
I5
W6
X7
f8
g9
u10
v11
�12
�13
�14
�15
�16
�17
�18
�19
�
0
1
2
3
4
5
6
7
	8

9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24

�0
�1
�2
 
 
 
 
 
 
 

*0
+1
 
 
 
 
 
 
 
 
 

90
:1
 
 
 
 
 
 
 
 
 

H0
I1
 
 
 
 
 
 
 
 
 

W0
X1
 
 
 
 
 
 
 
 
 

f0
g1
 
 
 
 
 
 
 
 
 

u0
v1
 
 
 
 
 
 
 
 
 
 
 
 
 
 

�0
�1
 
 
 
 

�0
�1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

�0
�1
 
 
 
 

�0
�1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
8

�total

�count
�	variables
�	keras_api
8

�total

�count
�	variables
�	keras_api
8

�total

�count
�	variables
�	keras_api
OM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE
OM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE

�0
�1

�	variables
QO
VARIABLE_VALUEtotal_14keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE
QO
VARIABLE_VALUEcount_14keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE

�0
�1

�	variables
QO
VARIABLE_VALUEtotal_24keras_api/metrics/2/total/.ATTRIBUTES/VARIABLE_VALUE
QO
VARIABLE_VALUEcount_24keras_api/metrics/2/count/.ATTRIBUTES/VARIABLE_VALUE

�0
�1

�	variables
�
serving_default_input_2Placeholder*0
_output_shapes
:���������	�*
dtype0*%
shape:���������	�
�
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_2Convolutional_Layer_0/kernelConvolutional_Layer_0/biasBatch_Normalization_0/gammaBatch_Normalization_0/beta!Batch_Normalization_0/moving_mean%Batch_Normalization_0/moving_varianceConvolutional_Layer_1/kernelConvolutional_Layer_1/biasBatch_Normalization_1/gammaBatch_Normalization_1/beta!Batch_Normalization_1/moving_mean%Batch_Normalization_1/moving_varianceConvolutional_Layer_2/kernelConvolutional_Layer_2/biasBatch_Normalization_2/gammaBatch_Normalization_2/beta!Batch_Normalization_2/moving_mean%Batch_Normalization_2/moving_varianceConvolutional_Layer_3/kernelConvolutional_Layer_3/biasBatch_Normalization_3/gammaBatch_Normalization_3/beta!Batch_Normalization_3/moving_mean%Batch_Normalization_3/moving_varianceConvolutional_Layer_4/kernelConvolutional_Layer_4/biasBatch_Normalization_4/gammaBatch_Normalization_4/beta!Batch_Normalization_4/moving_mean%Batch_Normalization_4/moving_varianceConvolutional_Layer_5/kernelConvolutional_Layer_5/biasBatch_Normalization_5/gammaBatch_Normalization_5/beta!Batch_Normalization_5/moving_mean%Batch_Normalization_5/moving_variance#Policy_Convolutional_Layer_1/kernel!Policy_Convolutional_Layer_1/bias Value_Convolutional_Layer/kernelValue_Convolutional_Layer/bias"Policy_Batch_Normalization_1/gamma!Policy_Batch_Normalization_1/beta(Policy_Batch_Normalization_1/moving_mean,Policy_Batch_Normalization_1/moving_variance!Value_Batch_Normalization_1/gamma Value_Batch_Normalization_1/beta'Value_Batch_Normalization_1/moving_mean+Value_Batch_Normalization_1/moving_variance#Policy_Convolutional_Layer_2/kernel!Policy_Convolutional_Layer_2/bias"Policy_Batch_Normalization_2/gamma!Policy_Batch_Normalization_2/beta(Policy_Batch_Normalization_2/moving_mean,Policy_Batch_Normalization_2/moving_varianceValue_Dense_Layer/kernelValue_Dense_Layer/bias+Value_Batch_Normalization_2/moving_variance!Value_Batch_Normalization_2/gamma'Value_Batch_Normalization_2/moving_mean Value_Batch_Normalization_2/betaPolicy_Head/kernelPolicy_Head/biasValue_Head/kernelValue_Head/bias*L
TinE
C2A*
Tout
2*
_collective_manager_ids
 *;
_output_shapes)
':����������:���������*b
_read_only_resource_inputsD
B@	
 !"#$%&'()*+,-./0123456789:;<=>?@*-
config_proto

CPU

GPU 2J 8� *+
f&R$
"__inference_signature_wrapper_5270
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
�
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename0Convolutional_Layer_0/kernel/Read/ReadVariableOp.Convolutional_Layer_0/bias/Read/ReadVariableOp/Batch_Normalization_0/gamma/Read/ReadVariableOp.Batch_Normalization_0/beta/Read/ReadVariableOp5Batch_Normalization_0/moving_mean/Read/ReadVariableOp9Batch_Normalization_0/moving_variance/Read/ReadVariableOp0Convolutional_Layer_1/kernel/Read/ReadVariableOp.Convolutional_Layer_1/bias/Read/ReadVariableOp/Batch_Normalization_1/gamma/Read/ReadVariableOp.Batch_Normalization_1/beta/Read/ReadVariableOp5Batch_Normalization_1/moving_mean/Read/ReadVariableOp9Batch_Normalization_1/moving_variance/Read/ReadVariableOp0Convolutional_Layer_2/kernel/Read/ReadVariableOp.Convolutional_Layer_2/bias/Read/ReadVariableOp/Batch_Normalization_2/gamma/Read/ReadVariableOp.Batch_Normalization_2/beta/Read/ReadVariableOp5Batch_Normalization_2/moving_mean/Read/ReadVariableOp9Batch_Normalization_2/moving_variance/Read/ReadVariableOp0Convolutional_Layer_3/kernel/Read/ReadVariableOp.Convolutional_Layer_3/bias/Read/ReadVariableOp/Batch_Normalization_3/gamma/Read/ReadVariableOp.Batch_Normalization_3/beta/Read/ReadVariableOp5Batch_Normalization_3/moving_mean/Read/ReadVariableOp9Batch_Normalization_3/moving_variance/Read/ReadVariableOp0Convolutional_Layer_4/kernel/Read/ReadVariableOp.Convolutional_Layer_4/bias/Read/ReadVariableOp/Batch_Normalization_4/gamma/Read/ReadVariableOp.Batch_Normalization_4/beta/Read/ReadVariableOp5Batch_Normalization_4/moving_mean/Read/ReadVariableOp9Batch_Normalization_4/moving_variance/Read/ReadVariableOp0Convolutional_Layer_5/kernel/Read/ReadVariableOp.Convolutional_Layer_5/bias/Read/ReadVariableOp/Batch_Normalization_5/gamma/Read/ReadVariableOp.Batch_Normalization_5/beta/Read/ReadVariableOp5Batch_Normalization_5/moving_mean/Read/ReadVariableOp9Batch_Normalization_5/moving_variance/Read/ReadVariableOp4Value_Convolutional_Layer/kernel/Read/ReadVariableOp2Value_Convolutional_Layer/bias/Read/ReadVariableOp7Policy_Convolutional_Layer_1/kernel/Read/ReadVariableOp5Policy_Convolutional_Layer_1/bias/Read/ReadVariableOp5Value_Batch_Normalization_1/gamma/Read/ReadVariableOp4Value_Batch_Normalization_1/beta/Read/ReadVariableOp;Value_Batch_Normalization_1/moving_mean/Read/ReadVariableOp?Value_Batch_Normalization_1/moving_variance/Read/ReadVariableOp6Policy_Batch_Normalization_1/gamma/Read/ReadVariableOp5Policy_Batch_Normalization_1/beta/Read/ReadVariableOp<Policy_Batch_Normalization_1/moving_mean/Read/ReadVariableOp@Policy_Batch_Normalization_1/moving_variance/Read/ReadVariableOp7Policy_Convolutional_Layer_2/kernel/Read/ReadVariableOp5Policy_Convolutional_Layer_2/bias/Read/ReadVariableOp,Value_Dense_Layer/kernel/Read/ReadVariableOp*Value_Dense_Layer/bias/Read/ReadVariableOp6Policy_Batch_Normalization_2/gamma/Read/ReadVariableOp5Policy_Batch_Normalization_2/beta/Read/ReadVariableOp<Policy_Batch_Normalization_2/moving_mean/Read/ReadVariableOp@Policy_Batch_Normalization_2/moving_variance/Read/ReadVariableOp5Value_Batch_Normalization_2/gamma/Read/ReadVariableOp4Value_Batch_Normalization_2/beta/Read/ReadVariableOp;Value_Batch_Normalization_2/moving_mean/Read/ReadVariableOp?Value_Batch_Normalization_2/moving_variance/Read/ReadVariableOp%Value_Head/kernel/Read/ReadVariableOp#Value_Head/bias/Read/ReadVariableOp&Policy_Head/kernel/Read/ReadVariableOp$Policy_Head/bias/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOptotal_2/Read/ReadVariableOpcount_2/Read/ReadVariableOpConst*S
TinL
J2H*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *&
f!R
__inference__traced_save_8556
�
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameConvolutional_Layer_0/kernelConvolutional_Layer_0/biasBatch_Normalization_0/gammaBatch_Normalization_0/beta!Batch_Normalization_0/moving_mean%Batch_Normalization_0/moving_varianceConvolutional_Layer_1/kernelConvolutional_Layer_1/biasBatch_Normalization_1/gammaBatch_Normalization_1/beta!Batch_Normalization_1/moving_mean%Batch_Normalization_1/moving_varianceConvolutional_Layer_2/kernelConvolutional_Layer_2/biasBatch_Normalization_2/gammaBatch_Normalization_2/beta!Batch_Normalization_2/moving_mean%Batch_Normalization_2/moving_varianceConvolutional_Layer_3/kernelConvolutional_Layer_3/biasBatch_Normalization_3/gammaBatch_Normalization_3/beta!Batch_Normalization_3/moving_mean%Batch_Normalization_3/moving_varianceConvolutional_Layer_4/kernelConvolutional_Layer_4/biasBatch_Normalization_4/gammaBatch_Normalization_4/beta!Batch_Normalization_4/moving_mean%Batch_Normalization_4/moving_varianceConvolutional_Layer_5/kernelConvolutional_Layer_5/biasBatch_Normalization_5/gammaBatch_Normalization_5/beta!Batch_Normalization_5/moving_mean%Batch_Normalization_5/moving_variance Value_Convolutional_Layer/kernelValue_Convolutional_Layer/bias#Policy_Convolutional_Layer_1/kernel!Policy_Convolutional_Layer_1/bias!Value_Batch_Normalization_1/gamma Value_Batch_Normalization_1/beta'Value_Batch_Normalization_1/moving_mean+Value_Batch_Normalization_1/moving_variance"Policy_Batch_Normalization_1/gamma!Policy_Batch_Normalization_1/beta(Policy_Batch_Normalization_1/moving_mean,Policy_Batch_Normalization_1/moving_variance#Policy_Convolutional_Layer_2/kernel!Policy_Convolutional_Layer_2/biasValue_Dense_Layer/kernelValue_Dense_Layer/bias"Policy_Batch_Normalization_2/gamma!Policy_Batch_Normalization_2/beta(Policy_Batch_Normalization_2/moving_mean,Policy_Batch_Normalization_2/moving_variance!Value_Batch_Normalization_2/gamma Value_Batch_Normalization_2/beta'Value_Batch_Normalization_2/moving_mean+Value_Batch_Normalization_2/moving_varianceValue_Head/kernelValue_Head/biasPolicy_Head/kernelPolicy_Head/biastotalcounttotal_1count_1total_2count_2*R
TinK
I2G*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *)
f$R"
 __inference__traced_restore_8776��2
�
�
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_7134

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_3660

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_6648

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�	
�
:__inference_Value_Batch_Normalization_1_layer_call_fn_7434

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *^
fYRW
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_2030�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
i
M__inference_Value_Flatten_Layer_layer_call_and_return_conditional_losses_2741

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"����?   \
ReshapeReshapeinputsConst:output:0*
T0*'
_output_shapes
:���������?X
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:���������?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
��
�+
A__inference_model_1_layer_call_and_return_conditional_losses_4989
input_25
convolutional_layer_0_4691:�(
convolutional_layer_0_4693:(
batch_normalization_0_4696:(
batch_normalization_0_4698:(
batch_normalization_0_4700:(
batch_normalization_0_4702:4
convolutional_layer_1_4705:(
convolutional_layer_1_4707:(
batch_normalization_1_4710:(
batch_normalization_1_4712:(
batch_normalization_1_4714:(
batch_normalization_1_4716:4
convolutional_layer_2_4719:(
convolutional_layer_2_4721:(
batch_normalization_2_4724:(
batch_normalization_2_4726:(
batch_normalization_2_4728:(
batch_normalization_2_4730:4
convolutional_layer_3_4733:(
convolutional_layer_3_4735:(
batch_normalization_3_4738:(
batch_normalization_3_4740:(
batch_normalization_3_4742:(
batch_normalization_3_4744:4
convolutional_layer_4_4747:(
convolutional_layer_4_4749:(
batch_normalization_4_4752:(
batch_normalization_4_4754:(
batch_normalization_4_4756:(
batch_normalization_4_4758:4
convolutional_layer_5_4761:(
convolutional_layer_5_4763:(
batch_normalization_5_4766:(
batch_normalization_5_4768:(
batch_normalization_5_4770:(
batch_normalization_5_4772:;
!policy_convolutional_layer_1_4775:/
!policy_convolutional_layer_1_4777:8
value_convolutional_layer_4780:,
value_convolutional_layer_4782:/
!policy_batch_normalization_1_4785:/
!policy_batch_normalization_1_4787:/
!policy_batch_normalization_1_4789:/
!policy_batch_normalization_1_4791:.
 value_batch_normalization_1_4794:.
 value_batch_normalization_1_4796:.
 value_batch_normalization_1_4798:.
 value_batch_normalization_1_4800:;
!policy_convolutional_layer_2_4803:/
!policy_convolutional_layer_2_4805:/
!policy_batch_normalization_2_4809:/
!policy_batch_normalization_2_4811:/
!policy_batch_normalization_2_4813:/
!policy_batch_normalization_2_4815:(
value_dense_layer_4818:?@$
value_dense_layer_4820:@.
 value_batch_normalization_2_4824:@.
 value_batch_normalization_2_4826:@.
 value_batch_normalization_2_4828:@.
 value_batch_normalization_2_4830:@#
policy_head_4833:	?�
policy_head_4835:	�!
value_head_4838:@
value_head_4840:
identity

identity_1��-Batch_Normalization_0/StatefulPartitionedCall�-Batch_Normalization_1/StatefulPartitionedCall�-Batch_Normalization_2/StatefulPartitionedCall�-Batch_Normalization_3/StatefulPartitionedCall�-Batch_Normalization_4/StatefulPartitionedCall�-Batch_Normalization_5/StatefulPartitionedCall�-Convolutional_Layer_0/StatefulPartitionedCall�<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp�-Convolutional_Layer_1/StatefulPartitionedCall�<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp�-Convolutional_Layer_2/StatefulPartitionedCall�<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp�-Convolutional_Layer_3/StatefulPartitionedCall�<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp�-Convolutional_Layer_4/StatefulPartitionedCall�<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp�-Convolutional_Layer_5/StatefulPartitionedCall�<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp�4Policy_Batch_Normalization_1/StatefulPartitionedCall�4Policy_Batch_Normalization_2/StatefulPartitionedCall�4Policy_Convolutional_Layer_1/StatefulPartitionedCall�CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp�EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp�4Policy_Convolutional_Layer_2/StatefulPartitionedCall�CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp�EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp�#Policy_Head/StatefulPartitionedCall�2Policy_Head/bias/Regularizer/Square/ReadVariableOp�4Policy_Head/kernel/Regularizer/Square/ReadVariableOp�3Value_Batch_Normalization_1/StatefulPartitionedCall�3Value_Batch_Normalization_2/StatefulPartitionedCall�1Value_Convolutional_Layer/StatefulPartitionedCall�@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp�BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp�)Value_Dense_Layer/StatefulPartitionedCall�8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp�:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp�"Value_Head/StatefulPartitionedCall�1Value_Head/bias/Regularizer/Square/ReadVariableOp�3Value_Head/kernel/Regularizer/Square/ReadVariableOp�
-Convolutional_Layer_0/StatefulPartitionedCallStatefulPartitionedCallinput_2convolutional_layer_0_4691convolutional_layer_0_4693*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_0_layer_call_and_return_conditional_losses_2281�
-Batch_Normalization_0/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_0/StatefulPartitionedCall:output:0batch_normalization_0_4696batch_normalization_0_4698batch_normalization_0_4700batch_normalization_0_4702*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_3660�
-Convolutional_Layer_1/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_0/StatefulPartitionedCall:output:0convolutional_layer_1_4705convolutional_layer_1_4707*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_1_layer_call_and_return_conditional_losses_2337�
-Batch_Normalization_1/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_1/StatefulPartitionedCall:output:0batch_normalization_1_4710batch_normalization_1_4712batch_normalization_1_4714batch_normalization_1_4716*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_3606�
-Convolutional_Layer_2/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_1/StatefulPartitionedCall:output:0convolutional_layer_2_4719convolutional_layer_2_4721*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_2_layer_call_and_return_conditional_losses_2393�
-Batch_Normalization_2/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_2/StatefulPartitionedCall:output:0batch_normalization_2_4724batch_normalization_2_4726batch_normalization_2_4728batch_normalization_2_4730*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_3552�
-Convolutional_Layer_3/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_2/StatefulPartitionedCall:output:0convolutional_layer_3_4733convolutional_layer_3_4735*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_3_layer_call_and_return_conditional_losses_2449�
-Batch_Normalization_3/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_3/StatefulPartitionedCall:output:0batch_normalization_3_4738batch_normalization_3_4740batch_normalization_3_4742batch_normalization_3_4744*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_3498�
-Convolutional_Layer_4/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_3/StatefulPartitionedCall:output:0convolutional_layer_4_4747convolutional_layer_4_4749*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_4_layer_call_and_return_conditional_losses_2505�
-Batch_Normalization_4/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_4/StatefulPartitionedCall:output:0batch_normalization_4_4752batch_normalization_4_4754batch_normalization_4_4756batch_normalization_4_4758*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_3444�
-Convolutional_Layer_5/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_4/StatefulPartitionedCall:output:0convolutional_layer_5_4761convolutional_layer_5_4763*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_5_layer_call_and_return_conditional_losses_2561�
-Batch_Normalization_5/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_5/StatefulPartitionedCall:output:0batch_normalization_5_4766batch_normalization_5_4768batch_normalization_5_4770batch_normalization_5_4772*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_3390�
4Policy_Convolutional_Layer_1/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_5/StatefulPartitionedCall:output:0!policy_convolutional_layer_1_4775!policy_convolutional_layer_1_4777*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Convolutional_Layer_1_layer_call_and_return_conditional_losses_2617�
1Value_Convolutional_Layer/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_5/StatefulPartitionedCall:output:0value_convolutional_layer_4780value_convolutional_layer_4782*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *\
fWRU
S__inference_Value_Convolutional_Layer_layer_call_and_return_conditional_losses_2646�
4Policy_Batch_Normalization_1/StatefulPartitionedCallStatefulPartitionedCall=Policy_Convolutional_Layer_1/StatefulPartitionedCall:output:0!policy_batch_normalization_1_4785!policy_batch_normalization_1_4787!policy_batch_normalization_1_4789!policy_batch_normalization_1_4791*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_3326�
3Value_Batch_Normalization_1/StatefulPartitionedCallStatefulPartitionedCall:Value_Convolutional_Layer/StatefulPartitionedCall:output:0 value_batch_normalization_1_4794 value_batch_normalization_1_4796 value_batch_normalization_1_4798 value_batch_normalization_1_4800*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *^
fYRW
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_3282�
4Policy_Convolutional_Layer_2/StatefulPartitionedCallStatefulPartitionedCall=Policy_Batch_Normalization_1/StatefulPartitionedCall:output:0!policy_convolutional_layer_2_4803!policy_convolutional_layer_2_4805*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Convolutional_Layer_2_layer_call_and_return_conditional_losses_2729�
#Value_Flatten_Layer/PartitionedCallPartitionedCall<Value_Batch_Normalization_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_Value_Flatten_Layer_layer_call_and_return_conditional_losses_2741�
4Policy_Batch_Normalization_2/StatefulPartitionedCallStatefulPartitionedCall=Policy_Convolutional_Layer_2/StatefulPartitionedCall:output:0!policy_batch_normalization_2_4809!policy_batch_normalization_2_4811!policy_batch_normalization_2_4813!policy_batch_normalization_2_4815*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_3222�
)Value_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall,Value_Flatten_Layer/PartitionedCall:output:0value_dense_layer_4818value_dense_layer_4820*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_Value_Dense_Layer_layer_call_and_return_conditional_losses_2793�
$Policy_Flatten_Layer/PartitionedCallPartitionedCall=Policy_Batch_Normalization_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *W
fRRP
N__inference_Policy_Flatten_Layer_layer_call_and_return_conditional_losses_2805�
3Value_Batch_Normalization_2/StatefulPartitionedCallStatefulPartitionedCall2Value_Dense_Layer/StatefulPartitionedCall:output:0 value_batch_normalization_2_4824 value_batch_normalization_2_4826 value_batch_normalization_2_4828 value_batch_normalization_2_4830*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *^
fYRW
U__inference_Value_Batch_Normalization_2_layer_call_and_return_conditional_losses_2240�
#Policy_Head/StatefulPartitionedCallStatefulPartitionedCall-Policy_Flatten_Layer/PartitionedCall:output:0policy_head_4833policy_head_4835*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *N
fIRG
E__inference_Policy_Head_layer_call_and_return_conditional_losses_2839�
"Value_Head/StatefulPartitionedCallStatefulPartitionedCall<Value_Batch_Normalization_2/StatefulPartitionedCall:output:0value_head_4838value_head_4840*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_Value_Head_layer_call_and_return_conditional_losses_2868�
>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_0_4691*'
_output_shapes
:�*
dtype0�
/Convolutional_Layer_0/kernel/Regularizer/SquareSquareFConvolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*'
_output_shapes
:��
.Convolutional_Layer_0/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_0/kernel/Regularizer/SumSum3Convolutional_Layer_0/kernel/Regularizer/Square:y:07Convolutional_Layer_0/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_0/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_0/kernel/Regularizer/mulMul7Convolutional_Layer_0/kernel/Regularizer/mul/x:output:05Convolutional_Layer_0/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_0_4693*
_output_shapes
:*
dtype0�
-Convolutional_Layer_0/bias/Regularizer/SquareSquareDConvolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_0/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_0/bias/Regularizer/SumSum1Convolutional_Layer_0/bias/Regularizer/Square:y:05Convolutional_Layer_0/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_0/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_0/bias/Regularizer/mulMul5Convolutional_Layer_0/bias/Regularizer/mul/x:output:03Convolutional_Layer_0/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_1_4705*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_1/kernel/Regularizer/SquareSquareFConvolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_1/kernel/Regularizer/SumSum3Convolutional_Layer_1/kernel/Regularizer/Square:y:07Convolutional_Layer_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_1/kernel/Regularizer/mulMul7Convolutional_Layer_1/kernel/Regularizer/mul/x:output:05Convolutional_Layer_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_1_4707*
_output_shapes
:*
dtype0�
-Convolutional_Layer_1/bias/Regularizer/SquareSquareDConvolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_1/bias/Regularizer/SumSum1Convolutional_Layer_1/bias/Regularizer/Square:y:05Convolutional_Layer_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_1/bias/Regularizer/mulMul5Convolutional_Layer_1/bias/Regularizer/mul/x:output:03Convolutional_Layer_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_2_4719*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_2/kernel/Regularizer/SquareSquareFConvolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_2/kernel/Regularizer/SumSum3Convolutional_Layer_2/kernel/Regularizer/Square:y:07Convolutional_Layer_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_2/kernel/Regularizer/mulMul7Convolutional_Layer_2/kernel/Regularizer/mul/x:output:05Convolutional_Layer_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_2_4721*
_output_shapes
:*
dtype0�
-Convolutional_Layer_2/bias/Regularizer/SquareSquareDConvolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_2/bias/Regularizer/SumSum1Convolutional_Layer_2/bias/Regularizer/Square:y:05Convolutional_Layer_2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_2/bias/Regularizer/mulMul5Convolutional_Layer_2/bias/Regularizer/mul/x:output:03Convolutional_Layer_2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_3_4733*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_3/kernel/Regularizer/SquareSquareFConvolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_3/kernel/Regularizer/SumSum3Convolutional_Layer_3/kernel/Regularizer/Square:y:07Convolutional_Layer_3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_3/kernel/Regularizer/mulMul7Convolutional_Layer_3/kernel/Regularizer/mul/x:output:05Convolutional_Layer_3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_3_4735*
_output_shapes
:*
dtype0�
-Convolutional_Layer_3/bias/Regularizer/SquareSquareDConvolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_3/bias/Regularizer/SumSum1Convolutional_Layer_3/bias/Regularizer/Square:y:05Convolutional_Layer_3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_3/bias/Regularizer/mulMul5Convolutional_Layer_3/bias/Regularizer/mul/x:output:03Convolutional_Layer_3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_4_4747*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_4/kernel/Regularizer/SquareSquareFConvolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_4/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_4/kernel/Regularizer/SumSum3Convolutional_Layer_4/kernel/Regularizer/Square:y:07Convolutional_Layer_4/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_4/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_4/kernel/Regularizer/mulMul7Convolutional_Layer_4/kernel/Regularizer/mul/x:output:05Convolutional_Layer_4/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_4_4749*
_output_shapes
:*
dtype0�
-Convolutional_Layer_4/bias/Regularizer/SquareSquareDConvolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_4/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_4/bias/Regularizer/SumSum1Convolutional_Layer_4/bias/Regularizer/Square:y:05Convolutional_Layer_4/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_4/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_4/bias/Regularizer/mulMul5Convolutional_Layer_4/bias/Regularizer/mul/x:output:03Convolutional_Layer_4/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_5_4761*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_5/kernel/Regularizer/SquareSquareFConvolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_5/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_5/kernel/Regularizer/SumSum3Convolutional_Layer_5/kernel/Regularizer/Square:y:07Convolutional_Layer_5/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_5/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_5/kernel/Regularizer/mulMul7Convolutional_Layer_5/kernel/Regularizer/mul/x:output:05Convolutional_Layer_5/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_5_4763*
_output_shapes
:*
dtype0�
-Convolutional_Layer_5/bias/Regularizer/SquareSquareDConvolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_5/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_5/bias/Regularizer/SumSum1Convolutional_Layer_5/bias/Regularizer/Square:y:05Convolutional_Layer_5/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_5/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_5/bias/Regularizer/mulMul5Convolutional_Layer_5/bias/Regularizer/mul/x:output:03Convolutional_Layer_5/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOpReadVariableOpvalue_convolutional_layer_4780*&
_output_shapes
:*
dtype0�
3Value_Convolutional_Layer/kernel/Regularizer/SquareSquareJValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
2Value_Convolutional_Layer/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
0Value_Convolutional_Layer/kernel/Regularizer/SumSum7Value_Convolutional_Layer/kernel/Regularizer/Square:y:0;Value_Convolutional_Layer/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: w
2Value_Convolutional_Layer/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
0Value_Convolutional_Layer/kernel/Regularizer/mulMul;Value_Convolutional_Layer/kernel/Regularizer/mul/x:output:09Value_Convolutional_Layer/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOpReadVariableOpvalue_convolutional_layer_4782*
_output_shapes
:*
dtype0�
1Value_Convolutional_Layer/bias/Regularizer/SquareSquareHValue_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:z
0Value_Convolutional_Layer/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
.Value_Convolutional_Layer/bias/Regularizer/SumSum5Value_Convolutional_Layer/bias/Regularizer/Square:y:09Value_Convolutional_Layer/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: u
0Value_Convolutional_Layer/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
.Value_Convolutional_Layer/bias/Regularizer/mulMul9Value_Convolutional_Layer/bias/Regularizer/mul/x:output:07Value_Convolutional_Layer/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp!policy_convolutional_layer_1_4775*&
_output_shapes
:*
dtype0�
6Policy_Convolutional_Layer_1/kernel/Regularizer/SquareSquareMPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
5Policy_Convolutional_Layer_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3Policy_Convolutional_Layer_1/kernel/Regularizer/SumSum:Policy_Convolutional_Layer_1/kernel/Regularizer/Square:y:0>Policy_Convolutional_Layer_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5Policy_Convolutional_Layer_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
3Policy_Convolutional_Layer_1/kernel/Regularizer/mulMul>Policy_Convolutional_Layer_1/kernel/Regularizer/mul/x:output:0<Policy_Convolutional_Layer_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpReadVariableOp!policy_convolutional_layer_1_4777*
_output_shapes
:*
dtype0�
4Policy_Convolutional_Layer_1/bias/Regularizer/SquareSquareKPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:}
3Policy_Convolutional_Layer_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
1Policy_Convolutional_Layer_1/bias/Regularizer/SumSum8Policy_Convolutional_Layer_1/bias/Regularizer/Square:y:0<Policy_Convolutional_Layer_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: x
3Policy_Convolutional_Layer_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
1Policy_Convolutional_Layer_1/bias/Regularizer/mulMul<Policy_Convolutional_Layer_1/bias/Regularizer/mul/x:output:0:Policy_Convolutional_Layer_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp!policy_convolutional_layer_2_4803*&
_output_shapes
:*
dtype0�
6Policy_Convolutional_Layer_2/kernel/Regularizer/SquareSquareMPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
5Policy_Convolutional_Layer_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3Policy_Convolutional_Layer_2/kernel/Regularizer/SumSum:Policy_Convolutional_Layer_2/kernel/Regularizer/Square:y:0>Policy_Convolutional_Layer_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5Policy_Convolutional_Layer_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
3Policy_Convolutional_Layer_2/kernel/Regularizer/mulMul>Policy_Convolutional_Layer_2/kernel/Regularizer/mul/x:output:0<Policy_Convolutional_Layer_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpReadVariableOp!policy_convolutional_layer_2_4805*
_output_shapes
:*
dtype0�
4Policy_Convolutional_Layer_2/bias/Regularizer/SquareSquareKPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:}
3Policy_Convolutional_Layer_2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
1Policy_Convolutional_Layer_2/bias/Regularizer/SumSum8Policy_Convolutional_Layer_2/bias/Regularizer/Square:y:0<Policy_Convolutional_Layer_2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: x
3Policy_Convolutional_Layer_2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
1Policy_Convolutional_Layer_2/bias/Regularizer/mulMul<Policy_Convolutional_Layer_2/bias/Regularizer/mul/x:output:0:Policy_Convolutional_Layer_2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOpReadVariableOpvalue_dense_layer_4818*
_output_shapes

:?@*
dtype0�
+Value_Dense_Layer/kernel/Regularizer/SquareSquareBValue_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:?@{
*Value_Dense_Layer/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
(Value_Dense_Layer/kernel/Regularizer/SumSum/Value_Dense_Layer/kernel/Regularizer/Square:y:03Value_Dense_Layer/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: o
*Value_Dense_Layer/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
(Value_Dense_Layer/kernel/Regularizer/mulMul3Value_Dense_Layer/kernel/Regularizer/mul/x:output:01Value_Dense_Layer/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOpReadVariableOpvalue_dense_layer_4820*
_output_shapes
:@*
dtype0�
)Value_Dense_Layer/bias/Regularizer/SquareSquare@Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:@r
(Value_Dense_Layer/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
&Value_Dense_Layer/bias/Regularizer/SumSum-Value_Dense_Layer/bias/Regularizer/Square:y:01Value_Dense_Layer/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: m
(Value_Dense_Layer/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
&Value_Dense_Layer/bias/Regularizer/mulMul1Value_Dense_Layer/bias/Regularizer/mul/x:output:0/Value_Dense_Layer/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
3Value_Head/kernel/Regularizer/Square/ReadVariableOpReadVariableOpvalue_head_4838*
_output_shapes

:@*
dtype0�
$Value_Head/kernel/Regularizer/SquareSquare;Value_Head/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@t
#Value_Head/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
!Value_Head/kernel/Regularizer/SumSum(Value_Head/kernel/Regularizer/Square:y:0,Value_Head/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: h
#Value_Head/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
!Value_Head/kernel/Regularizer/mulMul,Value_Head/kernel/Regularizer/mul/x:output:0*Value_Head/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: }
1Value_Head/bias/Regularizer/Square/ReadVariableOpReadVariableOpvalue_head_4840*
_output_shapes
:*
dtype0�
"Value_Head/bias/Regularizer/SquareSquare9Value_Head/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:k
!Value_Head/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
Value_Head/bias/Regularizer/SumSum&Value_Head/bias/Regularizer/Square:y:0*Value_Head/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: f
!Value_Head/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
Value_Head/bias/Regularizer/mulMul*Value_Head/bias/Regularizer/mul/x:output:0(Value_Head/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
4Policy_Head/kernel/Regularizer/Square/ReadVariableOpReadVariableOppolicy_head_4833*
_output_shapes
:	?�*
dtype0�
%Policy_Head/kernel/Regularizer/SquareSquare<Policy_Head/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?�u
$Policy_Head/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
"Policy_Head/kernel/Regularizer/SumSum)Policy_Head/kernel/Regularizer/Square:y:0-Policy_Head/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$Policy_Head/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
"Policy_Head/kernel/Regularizer/mulMul-Policy_Head/kernel/Regularizer/mul/x:output:0+Policy_Head/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
2Policy_Head/bias/Regularizer/Square/ReadVariableOpReadVariableOppolicy_head_4835*
_output_shapes	
:�*
dtype0�
#Policy_Head/bias/Regularizer/SquareSquare:Policy_Head/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes	
:�l
"Policy_Head/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
 Policy_Head/bias/Regularizer/SumSum'Policy_Head/bias/Regularizer/Square:y:0+Policy_Head/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: g
"Policy_Head/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
 Policy_Head/bias/Regularizer/mulMul+Policy_Head/bias/Regularizer/mul/x:output:0)Policy_Head/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: z
IdentityIdentity+Value_Head/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������~

Identity_1Identity,Policy_Head/StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:�����������
NoOpNoOp.^Batch_Normalization_0/StatefulPartitionedCall.^Batch_Normalization_1/StatefulPartitionedCall.^Batch_Normalization_2/StatefulPartitionedCall.^Batch_Normalization_3/StatefulPartitionedCall.^Batch_Normalization_4/StatefulPartitionedCall.^Batch_Normalization_5/StatefulPartitionedCall.^Convolutional_Layer_0/StatefulPartitionedCall=^Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp.^Convolutional_Layer_1/StatefulPartitionedCall=^Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp.^Convolutional_Layer_2/StatefulPartitionedCall=^Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp.^Convolutional_Layer_3/StatefulPartitionedCall=^Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp.^Convolutional_Layer_4/StatefulPartitionedCall=^Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp.^Convolutional_Layer_5/StatefulPartitionedCall=^Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp5^Policy_Batch_Normalization_1/StatefulPartitionedCall5^Policy_Batch_Normalization_2/StatefulPartitionedCall5^Policy_Convolutional_Layer_1/StatefulPartitionedCallD^Policy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpF^Policy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp5^Policy_Convolutional_Layer_2/StatefulPartitionedCallD^Policy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpF^Policy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp$^Policy_Head/StatefulPartitionedCall3^Policy_Head/bias/Regularizer/Square/ReadVariableOp5^Policy_Head/kernel/Regularizer/Square/ReadVariableOp4^Value_Batch_Normalization_1/StatefulPartitionedCall4^Value_Batch_Normalization_2/StatefulPartitionedCall2^Value_Convolutional_Layer/StatefulPartitionedCallA^Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOpC^Value_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp*^Value_Dense_Layer/StatefulPartitionedCall9^Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp;^Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp#^Value_Head/StatefulPartitionedCall2^Value_Head/bias/Regularizer/Square/ReadVariableOp4^Value_Head/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������	�: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2^
-Batch_Normalization_0/StatefulPartitionedCall-Batch_Normalization_0/StatefulPartitionedCall2^
-Batch_Normalization_1/StatefulPartitionedCall-Batch_Normalization_1/StatefulPartitionedCall2^
-Batch_Normalization_2/StatefulPartitionedCall-Batch_Normalization_2/StatefulPartitionedCall2^
-Batch_Normalization_3/StatefulPartitionedCall-Batch_Normalization_3/StatefulPartitionedCall2^
-Batch_Normalization_4/StatefulPartitionedCall-Batch_Normalization_4/StatefulPartitionedCall2^
-Batch_Normalization_5/StatefulPartitionedCall-Batch_Normalization_5/StatefulPartitionedCall2^
-Convolutional_Layer_0/StatefulPartitionedCall-Convolutional_Layer_0/StatefulPartitionedCall2|
<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp2^
-Convolutional_Layer_1/StatefulPartitionedCall-Convolutional_Layer_1/StatefulPartitionedCall2|
<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp2^
-Convolutional_Layer_2/StatefulPartitionedCall-Convolutional_Layer_2/StatefulPartitionedCall2|
<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp2^
-Convolutional_Layer_3/StatefulPartitionedCall-Convolutional_Layer_3/StatefulPartitionedCall2|
<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp2^
-Convolutional_Layer_4/StatefulPartitionedCall-Convolutional_Layer_4/StatefulPartitionedCall2|
<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp2^
-Convolutional_Layer_5/StatefulPartitionedCall-Convolutional_Layer_5/StatefulPartitionedCall2|
<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp2l
4Policy_Batch_Normalization_1/StatefulPartitionedCall4Policy_Batch_Normalization_1/StatefulPartitionedCall2l
4Policy_Batch_Normalization_2/StatefulPartitionedCall4Policy_Batch_Normalization_2/StatefulPartitionedCall2l
4Policy_Convolutional_Layer_1/StatefulPartitionedCall4Policy_Convolutional_Layer_1/StatefulPartitionedCall2�
CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpCPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp2�
EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpEPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp2l
4Policy_Convolutional_Layer_2/StatefulPartitionedCall4Policy_Convolutional_Layer_2/StatefulPartitionedCall2�
CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpCPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp2�
EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpEPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp2J
#Policy_Head/StatefulPartitionedCall#Policy_Head/StatefulPartitionedCall2h
2Policy_Head/bias/Regularizer/Square/ReadVariableOp2Policy_Head/bias/Regularizer/Square/ReadVariableOp2l
4Policy_Head/kernel/Regularizer/Square/ReadVariableOp4Policy_Head/kernel/Regularizer/Square/ReadVariableOp2j
3Value_Batch_Normalization_1/StatefulPartitionedCall3Value_Batch_Normalization_1/StatefulPartitionedCall2j
3Value_Batch_Normalization_2/StatefulPartitionedCall3Value_Batch_Normalization_2/StatefulPartitionedCall2f
1Value_Convolutional_Layer/StatefulPartitionedCall1Value_Convolutional_Layer/StatefulPartitionedCall2�
@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp2�
BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOpBValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp2V
)Value_Dense_Layer/StatefulPartitionedCall)Value_Dense_Layer/StatefulPartitionedCall2t
8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp2x
:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp2H
"Value_Head/StatefulPartitionedCall"Value_Head/StatefulPartitionedCall2f
1Value_Head/bias/Regularizer/Square/ReadVariableOp1Value_Head/bias/Regularizer/Square/ReadVariableOp2j
3Value_Head/kernel/Regularizer/Square/ReadVariableOp3Value_Head/kernel/Regularizer/Square/ReadVariableOp:Y U
0
_output_shapes
:���������	�
!
_user_specified_name	input_2
�
�
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_1743

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�	
�
4__inference_Batch_Normalization_1_layer_call_fn_6537

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_1679�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_2760

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_2094

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�	
�
4__inference_Batch_Normalization_1_layer_call_fn_6550

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_1710�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
:__inference_Value_Batch_Normalization_2_layer_call_fn_7892

inputs
unknown:@
	unknown_0:@
	unknown_1:@
	unknown_2:@
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *^
fYRW
U__inference_Value_Batch_Normalization_2_layer_call_and_return_conditional_losses_2193o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
�
�
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_1999

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_1902

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_7116

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
4__inference_Batch_Normalization_3_layer_call_fn_6912

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_3498w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Convolutional_Layer_2_layer_call_and_return_conditional_losses_6692

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������	�
>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_2/kernel/Regularizer/SquareSquareFConvolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_2/kernel/Regularizer/SumSum3Convolutional_Layer_2/kernel/Regularizer/Square:y:07Convolutional_Layer_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_2/kernel/Regularizer/mulMul7Convolutional_Layer_2/kernel/Regularizer/mul/x:output:05Convolutional_Layer_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_2/bias/Regularizer/SquareSquareDConvolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_2/bias/Regularizer/SumSum1Convolutional_Layer_2/bias/Regularizer/Square:y:05Convolutional_Layer_2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_2/bias/Regularizer/mulMul5Convolutional_Layer_2/bias/Regularizer/mul/x:output:03Convolutional_Layer_2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp=^Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2|
<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_7532

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_1615

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
__inference_loss_fn_16_8245h
Npolicy_convolutional_layer_2_kernel_regularizer_square_readvariableop_resource:
identity��EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp�
EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpNpolicy_convolutional_layer_2_kernel_regularizer_square_readvariableop_resource*&
_output_shapes
:*
dtype0�
6Policy_Convolutional_Layer_2/kernel/Regularizer/SquareSquareMPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
5Policy_Convolutional_Layer_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3Policy_Convolutional_Layer_2/kernel/Regularizer/SumSum:Policy_Convolutional_Layer_2/kernel/Regularizer/Square:y:0>Policy_Convolutional_Layer_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5Policy_Convolutional_Layer_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
3Policy_Convolutional_Layer_2/kernel/Regularizer/mulMul>Policy_Convolutional_Layer_2/kernel/Regularizer/mul/x:output:0<Policy_Convolutional_Layer_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: u
IdentityIdentity7Policy_Convolutional_Layer_2/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOpF^Policy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2�
EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpEPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp
�	
�
;__inference_Policy_Batch_Normalization_1_layer_call_fn_7545

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_2063�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�	
�
;__inference_Policy_Batch_Normalization_1_layer_call_fn_7558

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_2094�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�%
�
U__inference_Value_Batch_Normalization_2_layer_call_and_return_conditional_losses_7959

inputs5
'assignmovingavg_readvariableop_resource:@7
)assignmovingavg_1_readvariableop_resource:@3
%batchnorm_mul_readvariableop_resource:@/
!batchnorm_readvariableop_resource:@
identity��AssignMovingAvg�AssignMovingAvg/ReadVariableOp�AssignMovingAvg_1� AssignMovingAvg_1/ReadVariableOp�batchnorm/ReadVariableOp�batchnorm/mul/ReadVariableOph
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:@*
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:@�
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*'
_output_shapes
:���������@l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: �
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:@*
	keep_dims(m
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes
:@*
squeeze_dims
 s
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes
:@*
squeeze_dims
 Z
AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes
:@*
dtype0�
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes
:@x
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:@�
AssignMovingAvgAssignSubVariableOp'assignmovingavg_readvariableop_resourceAssignMovingAvg/mul:z:0^AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0\
AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes
:@*
dtype0�
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes
:@~
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:@�
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:q
batchnorm/addAddV2moments/Squeeze_1:output:0batchnorm/add/y:output:0*
T0*
_output_shapes
:@P
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
:@~
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
:@*
dtype0t
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:@c
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:���������@h
batchnorm/mul_2Mulmoments/Squeeze:output:0batchnorm/mul:z:0*
T0*
_output_shapes
:@v
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:@*
dtype0p
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
:@r
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:���������@b
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:���������@�
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������@: : : : 2"
AssignMovingAvgAssignMovingAvg2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
�
�
O__inference_Convolutional_Layer_1_layer_call_and_return_conditional_losses_2337

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������	�
>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_1/kernel/Regularizer/SquareSquareFConvolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_1/kernel/Regularizer/SumSum3Convolutional_Layer_1/kernel/Regularizer/Square:y:07Convolutional_Layer_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_1/kernel/Regularizer/mulMul7Convolutional_Layer_1/kernel/Regularizer/mul/x:output:05Convolutional_Layer_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_1/bias/Regularizer/SquareSquareDConvolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_1/bias/Regularizer/SumSum1Convolutional_Layer_1/bias/Regularizer/Square:y:05Convolutional_Layer_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_1/bias/Regularizer/mulMul5Convolutional_Layer_1/bias/Regularizer/mul/x:output:03Convolutional_Layer_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp=^Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2|
<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
��
�E
__inference__wrapped_model_1593
input_2W
<model_1_convolutional_layer_0_conv2d_readvariableop_resource:�K
=model_1_convolutional_layer_0_biasadd_readvariableop_resource:C
5model_1_batch_normalization_0_readvariableop_resource:E
7model_1_batch_normalization_0_readvariableop_1_resource:T
Fmodel_1_batch_normalization_0_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_0_fusedbatchnormv3_readvariableop_1_resource:V
<model_1_convolutional_layer_1_conv2d_readvariableop_resource:K
=model_1_convolutional_layer_1_biasadd_readvariableop_resource:C
5model_1_batch_normalization_1_readvariableop_resource:E
7model_1_batch_normalization_1_readvariableop_1_resource:T
Fmodel_1_batch_normalization_1_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_1_fusedbatchnormv3_readvariableop_1_resource:V
<model_1_convolutional_layer_2_conv2d_readvariableop_resource:K
=model_1_convolutional_layer_2_biasadd_readvariableop_resource:C
5model_1_batch_normalization_2_readvariableop_resource:E
7model_1_batch_normalization_2_readvariableop_1_resource:T
Fmodel_1_batch_normalization_2_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_2_fusedbatchnormv3_readvariableop_1_resource:V
<model_1_convolutional_layer_3_conv2d_readvariableop_resource:K
=model_1_convolutional_layer_3_biasadd_readvariableop_resource:C
5model_1_batch_normalization_3_readvariableop_resource:E
7model_1_batch_normalization_3_readvariableop_1_resource:T
Fmodel_1_batch_normalization_3_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_3_fusedbatchnormv3_readvariableop_1_resource:V
<model_1_convolutional_layer_4_conv2d_readvariableop_resource:K
=model_1_convolutional_layer_4_biasadd_readvariableop_resource:C
5model_1_batch_normalization_4_readvariableop_resource:E
7model_1_batch_normalization_4_readvariableop_1_resource:T
Fmodel_1_batch_normalization_4_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_4_fusedbatchnormv3_readvariableop_1_resource:V
<model_1_convolutional_layer_5_conv2d_readvariableop_resource:K
=model_1_convolutional_layer_5_biasadd_readvariableop_resource:C
5model_1_batch_normalization_5_readvariableop_resource:E
7model_1_batch_normalization_5_readvariableop_1_resource:T
Fmodel_1_batch_normalization_5_fusedbatchnormv3_readvariableop_resource:V
Hmodel_1_batch_normalization_5_fusedbatchnormv3_readvariableop_1_resource:]
Cmodel_1_policy_convolutional_layer_1_conv2d_readvariableop_resource:R
Dmodel_1_policy_convolutional_layer_1_biasadd_readvariableop_resource:Z
@model_1_value_convolutional_layer_conv2d_readvariableop_resource:O
Amodel_1_value_convolutional_layer_biasadd_readvariableop_resource:J
<model_1_policy_batch_normalization_1_readvariableop_resource:L
>model_1_policy_batch_normalization_1_readvariableop_1_resource:[
Mmodel_1_policy_batch_normalization_1_fusedbatchnormv3_readvariableop_resource:]
Omodel_1_policy_batch_normalization_1_fusedbatchnormv3_readvariableop_1_resource:I
;model_1_value_batch_normalization_1_readvariableop_resource:K
=model_1_value_batch_normalization_1_readvariableop_1_resource:Z
Lmodel_1_value_batch_normalization_1_fusedbatchnormv3_readvariableop_resource:\
Nmodel_1_value_batch_normalization_1_fusedbatchnormv3_readvariableop_1_resource:]
Cmodel_1_policy_convolutional_layer_2_conv2d_readvariableop_resource:R
Dmodel_1_policy_convolutional_layer_2_biasadd_readvariableop_resource:J
<model_1_policy_batch_normalization_2_readvariableop_resource:L
>model_1_policy_batch_normalization_2_readvariableop_1_resource:[
Mmodel_1_policy_batch_normalization_2_fusedbatchnormv3_readvariableop_resource:]
Omodel_1_policy_batch_normalization_2_fusedbatchnormv3_readvariableop_1_resource:J
8model_1_value_dense_layer_matmul_readvariableop_resource:?@G
9model_1_value_dense_layer_biasadd_readvariableop_resource:@S
Emodel_1_value_batch_normalization_2_batchnorm_readvariableop_resource:@W
Imodel_1_value_batch_normalization_2_batchnorm_mul_readvariableop_resource:@U
Gmodel_1_value_batch_normalization_2_batchnorm_readvariableop_1_resource:@U
Gmodel_1_value_batch_normalization_2_batchnorm_readvariableop_2_resource:@E
2model_1_policy_head_matmul_readvariableop_resource:	?�B
3model_1_policy_head_biasadd_readvariableop_resource:	�C
1model_1_value_head_matmul_readvariableop_resource:@@
2model_1_value_head_biasadd_readvariableop_resource:
identity

identity_1��=model_1/Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp�?model_1/Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp_1�,model_1/Batch_Normalization_0/ReadVariableOp�.model_1/Batch_Normalization_0/ReadVariableOp_1�=model_1/Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp�?model_1/Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1�,model_1/Batch_Normalization_1/ReadVariableOp�.model_1/Batch_Normalization_1/ReadVariableOp_1�=model_1/Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp�?model_1/Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1�,model_1/Batch_Normalization_2/ReadVariableOp�.model_1/Batch_Normalization_2/ReadVariableOp_1�=model_1/Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp�?model_1/Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp_1�,model_1/Batch_Normalization_3/ReadVariableOp�.model_1/Batch_Normalization_3/ReadVariableOp_1�=model_1/Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp�?model_1/Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp_1�,model_1/Batch_Normalization_4/ReadVariableOp�.model_1/Batch_Normalization_4/ReadVariableOp_1�=model_1/Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp�?model_1/Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp_1�,model_1/Batch_Normalization_5/ReadVariableOp�.model_1/Batch_Normalization_5/ReadVariableOp_1�4model_1/Convolutional_Layer_0/BiasAdd/ReadVariableOp�3model_1/Convolutional_Layer_0/Conv2D/ReadVariableOp�4model_1/Convolutional_Layer_1/BiasAdd/ReadVariableOp�3model_1/Convolutional_Layer_1/Conv2D/ReadVariableOp�4model_1/Convolutional_Layer_2/BiasAdd/ReadVariableOp�3model_1/Convolutional_Layer_2/Conv2D/ReadVariableOp�4model_1/Convolutional_Layer_3/BiasAdd/ReadVariableOp�3model_1/Convolutional_Layer_3/Conv2D/ReadVariableOp�4model_1/Convolutional_Layer_4/BiasAdd/ReadVariableOp�3model_1/Convolutional_Layer_4/Conv2D/ReadVariableOp�4model_1/Convolutional_Layer_5/BiasAdd/ReadVariableOp�3model_1/Convolutional_Layer_5/Conv2D/ReadVariableOp�Dmodel_1/Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp�Fmodel_1/Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1�3model_1/Policy_Batch_Normalization_1/ReadVariableOp�5model_1/Policy_Batch_Normalization_1/ReadVariableOp_1�Dmodel_1/Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp�Fmodel_1/Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1�3model_1/Policy_Batch_Normalization_2/ReadVariableOp�5model_1/Policy_Batch_Normalization_2/ReadVariableOp_1�;model_1/Policy_Convolutional_Layer_1/BiasAdd/ReadVariableOp�:model_1/Policy_Convolutional_Layer_1/Conv2D/ReadVariableOp�;model_1/Policy_Convolutional_Layer_2/BiasAdd/ReadVariableOp�:model_1/Policy_Convolutional_Layer_2/Conv2D/ReadVariableOp�*model_1/Policy_Head/BiasAdd/ReadVariableOp�)model_1/Policy_Head/MatMul/ReadVariableOp�Cmodel_1/Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp�Emodel_1/Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1�2model_1/Value_Batch_Normalization_1/ReadVariableOp�4model_1/Value_Batch_Normalization_1/ReadVariableOp_1�<model_1/Value_Batch_Normalization_2/batchnorm/ReadVariableOp�>model_1/Value_Batch_Normalization_2/batchnorm/ReadVariableOp_1�>model_1/Value_Batch_Normalization_2/batchnorm/ReadVariableOp_2�@model_1/Value_Batch_Normalization_2/batchnorm/mul/ReadVariableOp�8model_1/Value_Convolutional_Layer/BiasAdd/ReadVariableOp�7model_1/Value_Convolutional_Layer/Conv2D/ReadVariableOp�0model_1/Value_Dense_Layer/BiasAdd/ReadVariableOp�/model_1/Value_Dense_Layer/MatMul/ReadVariableOp�)model_1/Value_Head/BiasAdd/ReadVariableOp�(model_1/Value_Head/MatMul/ReadVariableOp�
3model_1/Convolutional_Layer_0/Conv2D/ReadVariableOpReadVariableOp<model_1_convolutional_layer_0_conv2d_readvariableop_resource*'
_output_shapes
:�*
dtype0�
$model_1/Convolutional_Layer_0/Conv2DConv2Dinput_2;model_1/Convolutional_Layer_0/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
4model_1/Convolutional_Layer_0/BiasAdd/ReadVariableOpReadVariableOp=model_1_convolutional_layer_0_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
%model_1/Convolutional_Layer_0/BiasAddBiasAdd-model_1/Convolutional_Layer_0/Conv2D:output:0<model_1/Convolutional_Layer_0/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
"model_1/Convolutional_Layer_0/ReluRelu.model_1/Convolutional_Layer_0/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
,model_1/Batch_Normalization_0/ReadVariableOpReadVariableOp5model_1_batch_normalization_0_readvariableop_resource*
_output_shapes
:*
dtype0�
.model_1/Batch_Normalization_0/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_0_readvariableop_1_resource*
_output_shapes
:*
dtype0�
=model_1/Batch_Normalization_0/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_0_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
?model_1/Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_0_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
.model_1/Batch_Normalization_0/FusedBatchNormV3FusedBatchNormV30model_1/Convolutional_Layer_0/Relu:activations:04model_1/Batch_Normalization_0/ReadVariableOp:value:06model_1/Batch_Normalization_0/ReadVariableOp_1:value:0Emodel_1/Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( �
3model_1/Convolutional_Layer_1/Conv2D/ReadVariableOpReadVariableOp<model_1_convolutional_layer_1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
$model_1/Convolutional_Layer_1/Conv2DConv2D2model_1/Batch_Normalization_0/FusedBatchNormV3:y:0;model_1/Convolutional_Layer_1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
4model_1/Convolutional_Layer_1/BiasAdd/ReadVariableOpReadVariableOp=model_1_convolutional_layer_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
%model_1/Convolutional_Layer_1/BiasAddBiasAdd-model_1/Convolutional_Layer_1/Conv2D:output:0<model_1/Convolutional_Layer_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
"model_1/Convolutional_Layer_1/ReluRelu.model_1/Convolutional_Layer_1/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
,model_1/Batch_Normalization_1/ReadVariableOpReadVariableOp5model_1_batch_normalization_1_readvariableop_resource*
_output_shapes
:*
dtype0�
.model_1/Batch_Normalization_1/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_1_readvariableop_1_resource*
_output_shapes
:*
dtype0�
=model_1/Batch_Normalization_1/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_1_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
?model_1/Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_1_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
.model_1/Batch_Normalization_1/FusedBatchNormV3FusedBatchNormV30model_1/Convolutional_Layer_1/Relu:activations:04model_1/Batch_Normalization_1/ReadVariableOp:value:06model_1/Batch_Normalization_1/ReadVariableOp_1:value:0Emodel_1/Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( �
3model_1/Convolutional_Layer_2/Conv2D/ReadVariableOpReadVariableOp<model_1_convolutional_layer_2_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
$model_1/Convolutional_Layer_2/Conv2DConv2D2model_1/Batch_Normalization_1/FusedBatchNormV3:y:0;model_1/Convolutional_Layer_2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
4model_1/Convolutional_Layer_2/BiasAdd/ReadVariableOpReadVariableOp=model_1_convolutional_layer_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
%model_1/Convolutional_Layer_2/BiasAddBiasAdd-model_1/Convolutional_Layer_2/Conv2D:output:0<model_1/Convolutional_Layer_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
"model_1/Convolutional_Layer_2/ReluRelu.model_1/Convolutional_Layer_2/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
,model_1/Batch_Normalization_2/ReadVariableOpReadVariableOp5model_1_batch_normalization_2_readvariableop_resource*
_output_shapes
:*
dtype0�
.model_1/Batch_Normalization_2/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_2_readvariableop_1_resource*
_output_shapes
:*
dtype0�
=model_1/Batch_Normalization_2/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_2_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
?model_1/Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_2_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
.model_1/Batch_Normalization_2/FusedBatchNormV3FusedBatchNormV30model_1/Convolutional_Layer_2/Relu:activations:04model_1/Batch_Normalization_2/ReadVariableOp:value:06model_1/Batch_Normalization_2/ReadVariableOp_1:value:0Emodel_1/Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( �
3model_1/Convolutional_Layer_3/Conv2D/ReadVariableOpReadVariableOp<model_1_convolutional_layer_3_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
$model_1/Convolutional_Layer_3/Conv2DConv2D2model_1/Batch_Normalization_2/FusedBatchNormV3:y:0;model_1/Convolutional_Layer_3/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
4model_1/Convolutional_Layer_3/BiasAdd/ReadVariableOpReadVariableOp=model_1_convolutional_layer_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
%model_1/Convolutional_Layer_3/BiasAddBiasAdd-model_1/Convolutional_Layer_3/Conv2D:output:0<model_1/Convolutional_Layer_3/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
"model_1/Convolutional_Layer_3/ReluRelu.model_1/Convolutional_Layer_3/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
,model_1/Batch_Normalization_3/ReadVariableOpReadVariableOp5model_1_batch_normalization_3_readvariableop_resource*
_output_shapes
:*
dtype0�
.model_1/Batch_Normalization_3/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
=model_1/Batch_Normalization_3/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_3_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
?model_1/Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_3_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
.model_1/Batch_Normalization_3/FusedBatchNormV3FusedBatchNormV30model_1/Convolutional_Layer_3/Relu:activations:04model_1/Batch_Normalization_3/ReadVariableOp:value:06model_1/Batch_Normalization_3/ReadVariableOp_1:value:0Emodel_1/Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( �
3model_1/Convolutional_Layer_4/Conv2D/ReadVariableOpReadVariableOp<model_1_convolutional_layer_4_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
$model_1/Convolutional_Layer_4/Conv2DConv2D2model_1/Batch_Normalization_3/FusedBatchNormV3:y:0;model_1/Convolutional_Layer_4/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
4model_1/Convolutional_Layer_4/BiasAdd/ReadVariableOpReadVariableOp=model_1_convolutional_layer_4_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
%model_1/Convolutional_Layer_4/BiasAddBiasAdd-model_1/Convolutional_Layer_4/Conv2D:output:0<model_1/Convolutional_Layer_4/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
"model_1/Convolutional_Layer_4/ReluRelu.model_1/Convolutional_Layer_4/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
,model_1/Batch_Normalization_4/ReadVariableOpReadVariableOp5model_1_batch_normalization_4_readvariableop_resource*
_output_shapes
:*
dtype0�
.model_1/Batch_Normalization_4/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_4_readvariableop_1_resource*
_output_shapes
:*
dtype0�
=model_1/Batch_Normalization_4/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_4_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
?model_1/Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_4_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
.model_1/Batch_Normalization_4/FusedBatchNormV3FusedBatchNormV30model_1/Convolutional_Layer_4/Relu:activations:04model_1/Batch_Normalization_4/ReadVariableOp:value:06model_1/Batch_Normalization_4/ReadVariableOp_1:value:0Emodel_1/Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( �
3model_1/Convolutional_Layer_5/Conv2D/ReadVariableOpReadVariableOp<model_1_convolutional_layer_5_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
$model_1/Convolutional_Layer_5/Conv2DConv2D2model_1/Batch_Normalization_4/FusedBatchNormV3:y:0;model_1/Convolutional_Layer_5/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
4model_1/Convolutional_Layer_5/BiasAdd/ReadVariableOpReadVariableOp=model_1_convolutional_layer_5_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
%model_1/Convolutional_Layer_5/BiasAddBiasAdd-model_1/Convolutional_Layer_5/Conv2D:output:0<model_1/Convolutional_Layer_5/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
"model_1/Convolutional_Layer_5/ReluRelu.model_1/Convolutional_Layer_5/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
,model_1/Batch_Normalization_5/ReadVariableOpReadVariableOp5model_1_batch_normalization_5_readvariableop_resource*
_output_shapes
:*
dtype0�
.model_1/Batch_Normalization_5/ReadVariableOp_1ReadVariableOp7model_1_batch_normalization_5_readvariableop_1_resource*
_output_shapes
:*
dtype0�
=model_1/Batch_Normalization_5/FusedBatchNormV3/ReadVariableOpReadVariableOpFmodel_1_batch_normalization_5_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
?model_1/Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpHmodel_1_batch_normalization_5_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
.model_1/Batch_Normalization_5/FusedBatchNormV3FusedBatchNormV30model_1/Convolutional_Layer_5/Relu:activations:04model_1/Batch_Normalization_5/ReadVariableOp:value:06model_1/Batch_Normalization_5/ReadVariableOp_1:value:0Emodel_1/Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp:value:0Gmodel_1/Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( �
:model_1/Policy_Convolutional_Layer_1/Conv2D/ReadVariableOpReadVariableOpCmodel_1_policy_convolutional_layer_1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
+model_1/Policy_Convolutional_Layer_1/Conv2DConv2D2model_1/Batch_Normalization_5/FusedBatchNormV3:y:0Bmodel_1/Policy_Convolutional_Layer_1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
;model_1/Policy_Convolutional_Layer_1/BiasAdd/ReadVariableOpReadVariableOpDmodel_1_policy_convolutional_layer_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
,model_1/Policy_Convolutional_Layer_1/BiasAddBiasAdd4model_1/Policy_Convolutional_Layer_1/Conv2D:output:0Cmodel_1/Policy_Convolutional_Layer_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
)model_1/Policy_Convolutional_Layer_1/ReluRelu5model_1/Policy_Convolutional_Layer_1/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
7model_1/Value_Convolutional_Layer/Conv2D/ReadVariableOpReadVariableOp@model_1_value_convolutional_layer_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
(model_1/Value_Convolutional_Layer/Conv2DConv2D2model_1/Batch_Normalization_5/FusedBatchNormV3:y:0?model_1/Value_Convolutional_Layer/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
8model_1/Value_Convolutional_Layer/BiasAdd/ReadVariableOpReadVariableOpAmodel_1_value_convolutional_layer_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
)model_1/Value_Convolutional_Layer/BiasAddBiasAdd1model_1/Value_Convolutional_Layer/Conv2D:output:0@model_1/Value_Convolutional_Layer/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
&model_1/Value_Convolutional_Layer/ReluRelu2model_1/Value_Convolutional_Layer/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
3model_1/Policy_Batch_Normalization_1/ReadVariableOpReadVariableOp<model_1_policy_batch_normalization_1_readvariableop_resource*
_output_shapes
:*
dtype0�
5model_1/Policy_Batch_Normalization_1/ReadVariableOp_1ReadVariableOp>model_1_policy_batch_normalization_1_readvariableop_1_resource*
_output_shapes
:*
dtype0�
Dmodel_1/Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOpReadVariableOpMmodel_1_policy_batch_normalization_1_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
Fmodel_1/Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpOmodel_1_policy_batch_normalization_1_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
5model_1/Policy_Batch_Normalization_1/FusedBatchNormV3FusedBatchNormV37model_1/Policy_Convolutional_Layer_1/Relu:activations:0;model_1/Policy_Batch_Normalization_1/ReadVariableOp:value:0=model_1/Policy_Batch_Normalization_1/ReadVariableOp_1:value:0Lmodel_1/Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp:value:0Nmodel_1/Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( �
2model_1/Value_Batch_Normalization_1/ReadVariableOpReadVariableOp;model_1_value_batch_normalization_1_readvariableop_resource*
_output_shapes
:*
dtype0�
4model_1/Value_Batch_Normalization_1/ReadVariableOp_1ReadVariableOp=model_1_value_batch_normalization_1_readvariableop_1_resource*
_output_shapes
:*
dtype0�
Cmodel_1/Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOpReadVariableOpLmodel_1_value_batch_normalization_1_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
Emodel_1/Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpNmodel_1_value_batch_normalization_1_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
4model_1/Value_Batch_Normalization_1/FusedBatchNormV3FusedBatchNormV34model_1/Value_Convolutional_Layer/Relu:activations:0:model_1/Value_Batch_Normalization_1/ReadVariableOp:value:0<model_1/Value_Batch_Normalization_1/ReadVariableOp_1:value:0Kmodel_1/Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp:value:0Mmodel_1/Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( �
:model_1/Policy_Convolutional_Layer_2/Conv2D/ReadVariableOpReadVariableOpCmodel_1_policy_convolutional_layer_2_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
+model_1/Policy_Convolutional_Layer_2/Conv2DConv2D9model_1/Policy_Batch_Normalization_1/FusedBatchNormV3:y:0Bmodel_1/Policy_Convolutional_Layer_2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
;model_1/Policy_Convolutional_Layer_2/BiasAdd/ReadVariableOpReadVariableOpDmodel_1_policy_convolutional_layer_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
,model_1/Policy_Convolutional_Layer_2/BiasAddBiasAdd4model_1/Policy_Convolutional_Layer_2/Conv2D:output:0Cmodel_1/Policy_Convolutional_Layer_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
)model_1/Policy_Convolutional_Layer_2/ReluRelu5model_1/Policy_Convolutional_Layer_2/BiasAdd:output:0*
T0*/
_output_shapes
:���������	r
!model_1/Value_Flatten_Layer/ConstConst*
_output_shapes
:*
dtype0*
valueB"����?   �
#model_1/Value_Flatten_Layer/ReshapeReshape8model_1/Value_Batch_Normalization_1/FusedBatchNormV3:y:0*model_1/Value_Flatten_Layer/Const:output:0*
T0*'
_output_shapes
:���������?�
3model_1/Policy_Batch_Normalization_2/ReadVariableOpReadVariableOp<model_1_policy_batch_normalization_2_readvariableop_resource*
_output_shapes
:*
dtype0�
5model_1/Policy_Batch_Normalization_2/ReadVariableOp_1ReadVariableOp>model_1_policy_batch_normalization_2_readvariableop_1_resource*
_output_shapes
:*
dtype0�
Dmodel_1/Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOpReadVariableOpMmodel_1_policy_batch_normalization_2_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
Fmodel_1/Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpOmodel_1_policy_batch_normalization_2_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
5model_1/Policy_Batch_Normalization_2/FusedBatchNormV3FusedBatchNormV37model_1/Policy_Convolutional_Layer_2/Relu:activations:0;model_1/Policy_Batch_Normalization_2/ReadVariableOp:value:0=model_1/Policy_Batch_Normalization_2/ReadVariableOp_1:value:0Lmodel_1/Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp:value:0Nmodel_1/Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( �
/model_1/Value_Dense_Layer/MatMul/ReadVariableOpReadVariableOp8model_1_value_dense_layer_matmul_readvariableop_resource*
_output_shapes

:?@*
dtype0�
 model_1/Value_Dense_Layer/MatMulMatMul,model_1/Value_Flatten_Layer/Reshape:output:07model_1/Value_Dense_Layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@�
0model_1/Value_Dense_Layer/BiasAdd/ReadVariableOpReadVariableOp9model_1_value_dense_layer_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
!model_1/Value_Dense_Layer/BiasAddBiasAdd*model_1/Value_Dense_Layer/MatMul:product:08model_1/Value_Dense_Layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@�
model_1/Value_Dense_Layer/ReluRelu*model_1/Value_Dense_Layer/BiasAdd:output:0*
T0*'
_output_shapes
:���������@s
"model_1/Policy_Flatten_Layer/ConstConst*
_output_shapes
:*
dtype0*
valueB"����?   �
$model_1/Policy_Flatten_Layer/ReshapeReshape9model_1/Policy_Batch_Normalization_2/FusedBatchNormV3:y:0+model_1/Policy_Flatten_Layer/Const:output:0*
T0*'
_output_shapes
:���������?�
<model_1/Value_Batch_Normalization_2/batchnorm/ReadVariableOpReadVariableOpEmodel_1_value_batch_normalization_2_batchnorm_readvariableop_resource*
_output_shapes
:@*
dtype0x
3model_1/Value_Batch_Normalization_2/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:�
1model_1/Value_Batch_Normalization_2/batchnorm/addAddV2Dmodel_1/Value_Batch_Normalization_2/batchnorm/ReadVariableOp:value:0<model_1/Value_Batch_Normalization_2/batchnorm/add/y:output:0*
T0*
_output_shapes
:@�
3model_1/Value_Batch_Normalization_2/batchnorm/RsqrtRsqrt5model_1/Value_Batch_Normalization_2/batchnorm/add:z:0*
T0*
_output_shapes
:@�
@model_1/Value_Batch_Normalization_2/batchnorm/mul/ReadVariableOpReadVariableOpImodel_1_value_batch_normalization_2_batchnorm_mul_readvariableop_resource*
_output_shapes
:@*
dtype0�
1model_1/Value_Batch_Normalization_2/batchnorm/mulMul7model_1/Value_Batch_Normalization_2/batchnorm/Rsqrt:y:0Hmodel_1/Value_Batch_Normalization_2/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:@�
3model_1/Value_Batch_Normalization_2/batchnorm/mul_1Mul,model_1/Value_Dense_Layer/Relu:activations:05model_1/Value_Batch_Normalization_2/batchnorm/mul:z:0*
T0*'
_output_shapes
:���������@�
>model_1/Value_Batch_Normalization_2/batchnorm/ReadVariableOp_1ReadVariableOpGmodel_1_value_batch_normalization_2_batchnorm_readvariableop_1_resource*
_output_shapes
:@*
dtype0�
3model_1/Value_Batch_Normalization_2/batchnorm/mul_2MulFmodel_1/Value_Batch_Normalization_2/batchnorm/ReadVariableOp_1:value:05model_1/Value_Batch_Normalization_2/batchnorm/mul:z:0*
T0*
_output_shapes
:@�
>model_1/Value_Batch_Normalization_2/batchnorm/ReadVariableOp_2ReadVariableOpGmodel_1_value_batch_normalization_2_batchnorm_readvariableop_2_resource*
_output_shapes
:@*
dtype0�
1model_1/Value_Batch_Normalization_2/batchnorm/subSubFmodel_1/Value_Batch_Normalization_2/batchnorm/ReadVariableOp_2:value:07model_1/Value_Batch_Normalization_2/batchnorm/mul_2:z:0*
T0*
_output_shapes
:@�
3model_1/Value_Batch_Normalization_2/batchnorm/add_1AddV27model_1/Value_Batch_Normalization_2/batchnorm/mul_1:z:05model_1/Value_Batch_Normalization_2/batchnorm/sub:z:0*
T0*'
_output_shapes
:���������@�
)model_1/Policy_Head/MatMul/ReadVariableOpReadVariableOp2model_1_policy_head_matmul_readvariableop_resource*
_output_shapes
:	?�*
dtype0�
model_1/Policy_Head/MatMulMatMul-model_1/Policy_Flatten_Layer/Reshape:output:01model_1/Policy_Head/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
*model_1/Policy_Head/BiasAdd/ReadVariableOpReadVariableOp3model_1_policy_head_biasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0�
model_1/Policy_Head/BiasAddBiasAdd$model_1/Policy_Head/MatMul:product:02model_1/Policy_Head/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������
model_1/Policy_Head/SoftmaxSoftmax$model_1/Policy_Head/BiasAdd:output:0*
T0*(
_output_shapes
:�����������
(model_1/Value_Head/MatMul/ReadVariableOpReadVariableOp1model_1_value_head_matmul_readvariableop_resource*
_output_shapes

:@*
dtype0�
model_1/Value_Head/MatMulMatMul7model_1/Value_Batch_Normalization_2/batchnorm/add_1:z:00model_1/Value_Head/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
)model_1/Value_Head/BiasAdd/ReadVariableOpReadVariableOp2model_1_value_head_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
model_1/Value_Head/BiasAddBiasAdd#model_1/Value_Head/MatMul:product:01model_1/Value_Head/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������v
model_1/Value_Head/TanhTanh#model_1/Value_Head/BiasAdd:output:0*
T0*'
_output_shapes
:���������u
IdentityIdentity%model_1/Policy_Head/Softmax:softmax:0^NoOp*
T0*(
_output_shapes
:����������l

Identity_1Identitymodel_1/Value_Head/Tanh:y:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp>^model_1/Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp@^model_1/Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp_1-^model_1/Batch_Normalization_0/ReadVariableOp/^model_1/Batch_Normalization_0/ReadVariableOp_1>^model_1/Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp@^model_1/Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1-^model_1/Batch_Normalization_1/ReadVariableOp/^model_1/Batch_Normalization_1/ReadVariableOp_1>^model_1/Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp@^model_1/Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1-^model_1/Batch_Normalization_2/ReadVariableOp/^model_1/Batch_Normalization_2/ReadVariableOp_1>^model_1/Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp@^model_1/Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp_1-^model_1/Batch_Normalization_3/ReadVariableOp/^model_1/Batch_Normalization_3/ReadVariableOp_1>^model_1/Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp@^model_1/Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp_1-^model_1/Batch_Normalization_4/ReadVariableOp/^model_1/Batch_Normalization_4/ReadVariableOp_1>^model_1/Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp@^model_1/Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp_1-^model_1/Batch_Normalization_5/ReadVariableOp/^model_1/Batch_Normalization_5/ReadVariableOp_15^model_1/Convolutional_Layer_0/BiasAdd/ReadVariableOp4^model_1/Convolutional_Layer_0/Conv2D/ReadVariableOp5^model_1/Convolutional_Layer_1/BiasAdd/ReadVariableOp4^model_1/Convolutional_Layer_1/Conv2D/ReadVariableOp5^model_1/Convolutional_Layer_2/BiasAdd/ReadVariableOp4^model_1/Convolutional_Layer_2/Conv2D/ReadVariableOp5^model_1/Convolutional_Layer_3/BiasAdd/ReadVariableOp4^model_1/Convolutional_Layer_3/Conv2D/ReadVariableOp5^model_1/Convolutional_Layer_4/BiasAdd/ReadVariableOp4^model_1/Convolutional_Layer_4/Conv2D/ReadVariableOp5^model_1/Convolutional_Layer_5/BiasAdd/ReadVariableOp4^model_1/Convolutional_Layer_5/Conv2D/ReadVariableOpE^model_1/Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOpG^model_1/Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_14^model_1/Policy_Batch_Normalization_1/ReadVariableOp6^model_1/Policy_Batch_Normalization_1/ReadVariableOp_1E^model_1/Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOpG^model_1/Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_14^model_1/Policy_Batch_Normalization_2/ReadVariableOp6^model_1/Policy_Batch_Normalization_2/ReadVariableOp_1<^model_1/Policy_Convolutional_Layer_1/BiasAdd/ReadVariableOp;^model_1/Policy_Convolutional_Layer_1/Conv2D/ReadVariableOp<^model_1/Policy_Convolutional_Layer_2/BiasAdd/ReadVariableOp;^model_1/Policy_Convolutional_Layer_2/Conv2D/ReadVariableOp+^model_1/Policy_Head/BiasAdd/ReadVariableOp*^model_1/Policy_Head/MatMul/ReadVariableOpD^model_1/Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOpF^model_1/Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_13^model_1/Value_Batch_Normalization_1/ReadVariableOp5^model_1/Value_Batch_Normalization_1/ReadVariableOp_1=^model_1/Value_Batch_Normalization_2/batchnorm/ReadVariableOp?^model_1/Value_Batch_Normalization_2/batchnorm/ReadVariableOp_1?^model_1/Value_Batch_Normalization_2/batchnorm/ReadVariableOp_2A^model_1/Value_Batch_Normalization_2/batchnorm/mul/ReadVariableOp9^model_1/Value_Convolutional_Layer/BiasAdd/ReadVariableOp8^model_1/Value_Convolutional_Layer/Conv2D/ReadVariableOp1^model_1/Value_Dense_Layer/BiasAdd/ReadVariableOp0^model_1/Value_Dense_Layer/MatMul/ReadVariableOp*^model_1/Value_Head/BiasAdd/ReadVariableOp)^model_1/Value_Head/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������	�: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2~
=model_1/Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp=model_1/Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp2�
?model_1/Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp_1?model_1/Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp_12\
,model_1/Batch_Normalization_0/ReadVariableOp,model_1/Batch_Normalization_0/ReadVariableOp2`
.model_1/Batch_Normalization_0/ReadVariableOp_1.model_1/Batch_Normalization_0/ReadVariableOp_12~
=model_1/Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp=model_1/Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp2�
?model_1/Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1?model_1/Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_12\
,model_1/Batch_Normalization_1/ReadVariableOp,model_1/Batch_Normalization_1/ReadVariableOp2`
.model_1/Batch_Normalization_1/ReadVariableOp_1.model_1/Batch_Normalization_1/ReadVariableOp_12~
=model_1/Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp=model_1/Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp2�
?model_1/Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1?model_1/Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_12\
,model_1/Batch_Normalization_2/ReadVariableOp,model_1/Batch_Normalization_2/ReadVariableOp2`
.model_1/Batch_Normalization_2/ReadVariableOp_1.model_1/Batch_Normalization_2/ReadVariableOp_12~
=model_1/Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp=model_1/Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp2�
?model_1/Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp_1?model_1/Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp_12\
,model_1/Batch_Normalization_3/ReadVariableOp,model_1/Batch_Normalization_3/ReadVariableOp2`
.model_1/Batch_Normalization_3/ReadVariableOp_1.model_1/Batch_Normalization_3/ReadVariableOp_12~
=model_1/Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp=model_1/Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp2�
?model_1/Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp_1?model_1/Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp_12\
,model_1/Batch_Normalization_4/ReadVariableOp,model_1/Batch_Normalization_4/ReadVariableOp2`
.model_1/Batch_Normalization_4/ReadVariableOp_1.model_1/Batch_Normalization_4/ReadVariableOp_12~
=model_1/Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp=model_1/Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp2�
?model_1/Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp_1?model_1/Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp_12\
,model_1/Batch_Normalization_5/ReadVariableOp,model_1/Batch_Normalization_5/ReadVariableOp2`
.model_1/Batch_Normalization_5/ReadVariableOp_1.model_1/Batch_Normalization_5/ReadVariableOp_12l
4model_1/Convolutional_Layer_0/BiasAdd/ReadVariableOp4model_1/Convolutional_Layer_0/BiasAdd/ReadVariableOp2j
3model_1/Convolutional_Layer_0/Conv2D/ReadVariableOp3model_1/Convolutional_Layer_0/Conv2D/ReadVariableOp2l
4model_1/Convolutional_Layer_1/BiasAdd/ReadVariableOp4model_1/Convolutional_Layer_1/BiasAdd/ReadVariableOp2j
3model_1/Convolutional_Layer_1/Conv2D/ReadVariableOp3model_1/Convolutional_Layer_1/Conv2D/ReadVariableOp2l
4model_1/Convolutional_Layer_2/BiasAdd/ReadVariableOp4model_1/Convolutional_Layer_2/BiasAdd/ReadVariableOp2j
3model_1/Convolutional_Layer_2/Conv2D/ReadVariableOp3model_1/Convolutional_Layer_2/Conv2D/ReadVariableOp2l
4model_1/Convolutional_Layer_3/BiasAdd/ReadVariableOp4model_1/Convolutional_Layer_3/BiasAdd/ReadVariableOp2j
3model_1/Convolutional_Layer_3/Conv2D/ReadVariableOp3model_1/Convolutional_Layer_3/Conv2D/ReadVariableOp2l
4model_1/Convolutional_Layer_4/BiasAdd/ReadVariableOp4model_1/Convolutional_Layer_4/BiasAdd/ReadVariableOp2j
3model_1/Convolutional_Layer_4/Conv2D/ReadVariableOp3model_1/Convolutional_Layer_4/Conv2D/ReadVariableOp2l
4model_1/Convolutional_Layer_5/BiasAdd/ReadVariableOp4model_1/Convolutional_Layer_5/BiasAdd/ReadVariableOp2j
3model_1/Convolutional_Layer_5/Conv2D/ReadVariableOp3model_1/Convolutional_Layer_5/Conv2D/ReadVariableOp2�
Dmodel_1/Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOpDmodel_1/Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp2�
Fmodel_1/Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1Fmodel_1/Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_12j
3model_1/Policy_Batch_Normalization_1/ReadVariableOp3model_1/Policy_Batch_Normalization_1/ReadVariableOp2n
5model_1/Policy_Batch_Normalization_1/ReadVariableOp_15model_1/Policy_Batch_Normalization_1/ReadVariableOp_12�
Dmodel_1/Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOpDmodel_1/Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp2�
Fmodel_1/Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1Fmodel_1/Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_12j
3model_1/Policy_Batch_Normalization_2/ReadVariableOp3model_1/Policy_Batch_Normalization_2/ReadVariableOp2n
5model_1/Policy_Batch_Normalization_2/ReadVariableOp_15model_1/Policy_Batch_Normalization_2/ReadVariableOp_12z
;model_1/Policy_Convolutional_Layer_1/BiasAdd/ReadVariableOp;model_1/Policy_Convolutional_Layer_1/BiasAdd/ReadVariableOp2x
:model_1/Policy_Convolutional_Layer_1/Conv2D/ReadVariableOp:model_1/Policy_Convolutional_Layer_1/Conv2D/ReadVariableOp2z
;model_1/Policy_Convolutional_Layer_2/BiasAdd/ReadVariableOp;model_1/Policy_Convolutional_Layer_2/BiasAdd/ReadVariableOp2x
:model_1/Policy_Convolutional_Layer_2/Conv2D/ReadVariableOp:model_1/Policy_Convolutional_Layer_2/Conv2D/ReadVariableOp2X
*model_1/Policy_Head/BiasAdd/ReadVariableOp*model_1/Policy_Head/BiasAdd/ReadVariableOp2V
)model_1/Policy_Head/MatMul/ReadVariableOp)model_1/Policy_Head/MatMul/ReadVariableOp2�
Cmodel_1/Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOpCmodel_1/Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp2�
Emodel_1/Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1Emodel_1/Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_12h
2model_1/Value_Batch_Normalization_1/ReadVariableOp2model_1/Value_Batch_Normalization_1/ReadVariableOp2l
4model_1/Value_Batch_Normalization_1/ReadVariableOp_14model_1/Value_Batch_Normalization_1/ReadVariableOp_12|
<model_1/Value_Batch_Normalization_2/batchnorm/ReadVariableOp<model_1/Value_Batch_Normalization_2/batchnorm/ReadVariableOp2�
>model_1/Value_Batch_Normalization_2/batchnorm/ReadVariableOp_1>model_1/Value_Batch_Normalization_2/batchnorm/ReadVariableOp_12�
>model_1/Value_Batch_Normalization_2/batchnorm/ReadVariableOp_2>model_1/Value_Batch_Normalization_2/batchnorm/ReadVariableOp_22�
@model_1/Value_Batch_Normalization_2/batchnorm/mul/ReadVariableOp@model_1/Value_Batch_Normalization_2/batchnorm/mul/ReadVariableOp2t
8model_1/Value_Convolutional_Layer/BiasAdd/ReadVariableOp8model_1/Value_Convolutional_Layer/BiasAdd/ReadVariableOp2r
7model_1/Value_Convolutional_Layer/Conv2D/ReadVariableOp7model_1/Value_Convolutional_Layer/Conv2D/ReadVariableOp2d
0model_1/Value_Dense_Layer/BiasAdd/ReadVariableOp0model_1/Value_Dense_Layer/BiasAdd/ReadVariableOp2b
/model_1/Value_Dense_Layer/MatMul/ReadVariableOp/model_1/Value_Dense_Layer/MatMul/ReadVariableOp2V
)model_1/Value_Head/BiasAdd/ReadVariableOp)model_1/Value_Head/BiasAdd/ReadVariableOp2T
(model_1/Value_Head/MatMul/ReadVariableOp(model_1/Value_Head/MatMul/ReadVariableOp:Y U
0
_output_shapes
:���������	�
!
_user_specified_name	input_2
�	
�
:__inference_Value_Batch_Normalization_1_layer_call_fn_7421

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *^
fYRW
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_1999�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_2304

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_1838

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�	
�
;__inference_Policy_Batch_Normalization_2_layer_call_fn_7768

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_2127�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
D__inference_Value_Head_layer_call_and_return_conditional_losses_2868

inputs0
matmul_readvariableop_resource:@-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�1Value_Head/bias/Regularizer/Square/ReadVariableOp�3Value_Head/kernel/Regularizer/Square/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������P
TanhTanhBiasAdd:output:0*
T0*'
_output_shapes
:����������
3Value_Head/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@*
dtype0�
$Value_Head/kernel/Regularizer/SquareSquare;Value_Head/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@t
#Value_Head/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
!Value_Head/kernel/Regularizer/SumSum(Value_Head/kernel/Regularizer/Square:y:0,Value_Head/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: h
#Value_Head/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
!Value_Head/kernel/Regularizer/mulMul,Value_Head/kernel/Regularizer/mul/x:output:0*Value_Head/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
1Value_Head/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"Value_Head/bias/Regularizer/SquareSquare9Value_Head/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:k
!Value_Head/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
Value_Head/bias/Regularizer/SumSum&Value_Head/bias/Regularizer/Square:y:0*Value_Head/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: f
!Value_Head/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
Value_Head/bias/Regularizer/mulMul*Value_Head/bias/Regularizer/mul/x:output:0(Value_Head/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: W
IdentityIdentityTanh:y:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp2^Value_Head/bias/Regularizer/Square/ReadVariableOp4^Value_Head/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2f
1Value_Head/bias/Regularizer/Square/ReadVariableOp1Value_Head/bias/Regularizer/Square/ReadVariableOp2j
3Value_Head/kernel/Regularizer/Square/ReadVariableOp3Value_Head/kernel/Regularizer/Square/ReadVariableOp:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
�
�
__inference_loss_fn_17_8256Z
Lpolicy_convolutional_layer_2_bias_regularizer_square_readvariableop_resource:
identity��CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp�
CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpReadVariableOpLpolicy_convolutional_layer_2_bias_regularizer_square_readvariableop_resource*
_output_shapes
:*
dtype0�
4Policy_Convolutional_Layer_2/bias/Regularizer/SquareSquareKPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:}
3Policy_Convolutional_Layer_2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
1Policy_Convolutional_Layer_2/bias/Regularizer/SumSum8Policy_Convolutional_Layer_2/bias/Regularizer/Square:y:0<Policy_Convolutional_Layer_2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: x
3Policy_Convolutional_Layer_2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
1Policy_Convolutional_Layer_2/bias/Regularizer/mulMul<Policy_Convolutional_Layer_2/bias/Regularizer/mul/x:output:0:Policy_Convolutional_Layer_2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: s
IdentityIdentity5Policy_Convolutional_Layer_2/bias/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOpD^Policy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2�
CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpCPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp
�
�
4__inference_Batch_Normalization_5_layer_call_fn_7235

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_2584w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_7266

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
S__inference_Value_Convolutional_Layer_layer_call_and_return_conditional_losses_7364

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp�BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������	�
BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
3Value_Convolutional_Layer/kernel/Regularizer/SquareSquareJValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
2Value_Convolutional_Layer/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
0Value_Convolutional_Layer/kernel/Regularizer/SumSum7Value_Convolutional_Layer/kernel/Regularizer/Square:y:0;Value_Convolutional_Layer/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: w
2Value_Convolutional_Layer/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
0Value_Convolutional_Layer/kernel/Regularizer/mulMul;Value_Convolutional_Layer/kernel/Regularizer/mul/x:output:09Value_Convolutional_Layer/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
1Value_Convolutional_Layer/bias/Regularizer/SquareSquareHValue_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:z
0Value_Convolutional_Layer/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
.Value_Convolutional_Layer/bias/Regularizer/SumSum5Value_Convolutional_Layer/bias/Regularizer/Square:y:09Value_Convolutional_Layer/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: u
0Value_Convolutional_Layer/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
.Value_Convolutional_Layer/bias/Regularizer/mulMul9Value_Convolutional_Layer/bias/Regularizer/mul/x:output:07Value_Convolutional_Layer/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOpA^Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOpC^Value_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2�
@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp2�
BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOpBValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_3282

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_7620

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_7152

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�%
�
U__inference_Value_Batch_Normalization_2_layer_call_and_return_conditional_losses_2240

inputs5
'assignmovingavg_readvariableop_resource:@7
)assignmovingavg_1_readvariableop_resource:@3
%batchnorm_mul_readvariableop_resource:@/
!batchnorm_readvariableop_resource:@
identity��AssignMovingAvg�AssignMovingAvg/ReadVariableOp�AssignMovingAvg_1� AssignMovingAvg_1/ReadVariableOp�batchnorm/ReadVariableOp�batchnorm/mul/ReadVariableOph
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:@*
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:@�
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*'
_output_shapes
:���������@l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: �
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:@*
	keep_dims(m
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes
:@*
squeeze_dims
 s
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes
:@*
squeeze_dims
 Z
AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes
:@*
dtype0�
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes
:@x
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:@�
AssignMovingAvgAssignSubVariableOp'assignmovingavg_readvariableop_resourceAssignMovingAvg/mul:z:0^AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0\
AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes
:@*
dtype0�
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes
:@~
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:@�
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:q
batchnorm/addAddV2moments/Squeeze_1:output:0batchnorm/add/y:output:0*
T0*
_output_shapes
:@P
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
:@~
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
:@*
dtype0t
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:@c
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:���������@h
batchnorm/mul_2Mulmoments/Squeeze:output:0batchnorm/mul:z:0*
T0*
_output_shapes
:@v
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:@*
dtype0p
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
:@r
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:���������@b
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:���������@�
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������@: : : : 2"
AssignMovingAvgAssignMovingAvg2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
�
�
__inference_loss_fn_1_8080S
Econvolutional_layer_0_bias_regularizer_square_readvariableop_resource:
identity��<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp�
<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOpReadVariableOpEconvolutional_layer_0_bias_regularizer_square_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_0/bias/Regularizer/SquareSquareDConvolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_0/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_0/bias/Regularizer/SumSum1Convolutional_Layer_0/bias/Regularizer/Square:y:05Convolutional_Layer_0/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_0/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_0/bias/Regularizer/mulMul5Convolutional_Layer_0/bias/Regularizer/mul/x:output:03Convolutional_Layer_0/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: l
IdentityIdentity.Convolutional_Layer_0/bias/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp=^Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2|
<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp
�
�
__inference_loss_fn_7_8146S
Econvolutional_layer_3_bias_regularizer_square_readvariableop_resource:
identity��<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp�
<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOpReadVariableOpEconvolutional_layer_3_bias_regularizer_square_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_3/bias/Regularizer/SquareSquareDConvolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_3/bias/Regularizer/SumSum1Convolutional_Layer_3/bias/Regularizer/Square:y:05Convolutional_Layer_3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_3/bias/Regularizer/mulMul5Convolutional_Layer_3/bias/Regularizer/mul/x:output:03Convolutional_Layer_3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: l
IdentityIdentity.Convolutional_Layer_3/bias/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp=^Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2|
<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp
�
�
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_1871

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_1935

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
__inference_loss_fn_21_8300H
:value_head_bias_regularizer_square_readvariableop_resource:
identity��1Value_Head/bias/Regularizer/Square/ReadVariableOp�
1Value_Head/bias/Regularizer/Square/ReadVariableOpReadVariableOp:value_head_bias_regularizer_square_readvariableop_resource*
_output_shapes
:*
dtype0�
"Value_Head/bias/Regularizer/SquareSquare9Value_Head/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:k
!Value_Head/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
Value_Head/bias/Regularizer/SumSum&Value_Head/bias/Regularizer/Square:y:0*Value_Head/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: f
!Value_Head/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
Value_Head/bias/Regularizer/mulMul*Value_Head/bias/Regularizer/mul/x:output:0(Value_Head/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: a
IdentityIdentity#Value_Head/bias/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: z
NoOpNoOp2^Value_Head/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2f
1Value_Head/bias/Regularizer/Square/ReadVariableOp1Value_Head/bias/Regularizer/Square/ReadVariableOp
�
�
4__inference_Batch_Normalization_1_layer_call_fn_6576

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_3606w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
:__inference_Value_Batch_Normalization_2_layer_call_fn_7905

inputs
unknown:@
	unknown_0:@
	unknown_1:@
	unknown_2:@
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *^
fYRW
U__inference_Value_Batch_Normalization_2_layer_call_and_return_conditional_losses_2240o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
�
�
O__inference_Convolutional_Layer_2_layer_call_and_return_conditional_losses_2393

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������	�
>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_2/kernel/Regularizer/SquareSquareFConvolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_2/kernel/Regularizer/SumSum3Convolutional_Layer_2/kernel/Regularizer/Square:y:07Convolutional_Layer_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_2/kernel/Regularizer/mulMul7Convolutional_Layer_2/kernel/Regularizer/mul/x:output:05Convolutional_Layer_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_2/bias/Regularizer/SquareSquareDConvolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_2/bias/Regularizer/SumSum1Convolutional_Layer_2/bias/Regularizer/Square:y:05Convolutional_Layer_2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_2/bias/Regularizer/mulMul5Convolutional_Layer_2/bias/Regularizer/mul/x:output:03Convolutional_Layer_2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp=^Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2|
<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
&__inference_model_1_layer_call_fn_4387
input_2"
unknown:�
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:#
	unknown_5:
	unknown_6:
	unknown_7:
	unknown_8:
	unknown_9:

unknown_10:$

unknown_11:

unknown_12:

unknown_13:

unknown_14:

unknown_15:

unknown_16:$

unknown_17:

unknown_18:

unknown_19:

unknown_20:

unknown_21:

unknown_22:$

unknown_23:

unknown_24:

unknown_25:

unknown_26:

unknown_27:

unknown_28:$

unknown_29:

unknown_30:

unknown_31:

unknown_32:

unknown_33:

unknown_34:$

unknown_35:

unknown_36:$

unknown_37:

unknown_38:

unknown_39:

unknown_40:

unknown_41:

unknown_42:

unknown_43:

unknown_44:

unknown_45:

unknown_46:$

unknown_47:

unknown_48:

unknown_49:

unknown_50:

unknown_51:

unknown_52:

unknown_53:?@

unknown_54:@

unknown_55:@

unknown_56:@

unknown_57:@

unknown_58:@

unknown_59:	?�

unknown_60:	�

unknown_61:@

unknown_62:
identity

identity_1��StatefulPartitionedCall�	
StatefulPartitionedCallStatefulPartitionedCallinput_2unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32
unknown_33
unknown_34
unknown_35
unknown_36
unknown_37
unknown_38
unknown_39
unknown_40
unknown_41
unknown_42
unknown_43
unknown_44
unknown_45
unknown_46
unknown_47
unknown_48
unknown_49
unknown_50
unknown_51
unknown_52
unknown_53
unknown_54
unknown_55
unknown_56
unknown_57
unknown_58
unknown_59
unknown_60
unknown_61
unknown_62*L
TinE
C2A*
Tout
2*
_collective_manager_ids
 *;
_output_shapes)
':���������:����������*N
_read_only_resource_inputs0
.,	
 !"%&'()*-.123478;<=>?@*-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_model_1_layer_call_and_return_conditional_losses_4119o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������r

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*(
_output_shapes
:����������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������	�: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Y U
0
_output_shapes
:���������	�
!
_user_specified_name	input_2
�
�
O__inference_Convolutional_Layer_5_layer_call_and_return_conditional_losses_7196

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������	�
>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_5/kernel/Regularizer/SquareSquareFConvolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_5/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_5/kernel/Regularizer/SumSum3Convolutional_Layer_5/kernel/Regularizer/Square:y:07Convolutional_Layer_5/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_5/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_5/kernel/Regularizer/mulMul7Convolutional_Layer_5/kernel/Regularizer/mul/x:output:05Convolutional_Layer_5/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_5/bias/Regularizer/SquareSquareDConvolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_5/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_5/bias/Regularizer/SumSum1Convolutional_Layer_5/bias/Regularizer/Square:y:05Convolutional_Layer_5/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_5/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_5/bias/Regularizer/mulMul5Convolutional_Layer_5/bias/Regularizer/mul/x:output:03Convolutional_Layer_5/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp=^Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2|
<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_3498

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_6594

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�	
�
4__inference_Batch_Normalization_5_layer_call_fn_7209

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_1935�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
O__inference_Convolutional_Layer_0_layer_call_and_return_conditional_losses_2281

inputs9
conv2d_readvariableop_resource:�-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp}
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*'
_output_shapes
:�*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������	�
>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*'
_output_shapes
:�*
dtype0�
/Convolutional_Layer_0/kernel/Regularizer/SquareSquareFConvolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*'
_output_shapes
:��
.Convolutional_Layer_0/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_0/kernel/Regularizer/SumSum3Convolutional_Layer_0/kernel/Regularizer/Square:y:07Convolutional_Layer_0/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_0/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_0/kernel/Regularizer/mulMul7Convolutional_Layer_0/kernel/Regularizer/mul/x:output:05Convolutional_Layer_0/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_0/bias/Regularizer/SquareSquareDConvolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_0/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_0/bias/Regularizer/SumSum1Convolutional_Layer_0/bias/Regularizer/Square:y:05Convolutional_Layer_0/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_0/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_0/bias/Regularizer/mulMul5Convolutional_Layer_0/bias/Regularizer/mul/x:output:03Convolutional_Layer_0/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp=^Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :���������	�: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2|
<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp:X T
0
_output_shapes
:���������	�
 
_user_specified_nameinputs
�
�
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_2063

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
U__inference_Value_Batch_Normalization_2_layer_call_and_return_conditional_losses_7925

inputs/
!batchnorm_readvariableop_resource:@3
%batchnorm_mul_readvariableop_resource:@1
#batchnorm_readvariableop_1_resource:@1
#batchnorm_readvariableop_2_resource:@
identity��batchnorm/ReadVariableOp�batchnorm/ReadVariableOp_1�batchnorm/ReadVariableOp_2�batchnorm/mul/ReadVariableOpv
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:@*
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:w
batchnorm/addAddV2 batchnorm/ReadVariableOp:value:0batchnorm/add/y:output:0*
T0*
_output_shapes
:@P
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
:@~
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
:@*
dtype0t
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:@c
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:���������@z
batchnorm/ReadVariableOp_1ReadVariableOp#batchnorm_readvariableop_1_resource*
_output_shapes
:@*
dtype0r
batchnorm/mul_2Mul"batchnorm/ReadVariableOp_1:value:0batchnorm/mul:z:0*
T0*
_output_shapes
:@z
batchnorm/ReadVariableOp_2ReadVariableOp#batchnorm_readvariableop_2_resource*
_output_shapes
:@*
dtype0r
batchnorm/subSub"batchnorm/ReadVariableOp_2:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
:@r
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:���������@b
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:���������@�
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������@: : : : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
�
�
__inference_loss_fn_9_8168S
Econvolutional_layer_4_bias_regularizer_square_readvariableop_resource:
identity��<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp�
<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOpReadVariableOpEconvolutional_layer_4_bias_regularizer_square_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_4/bias/Regularizer/SquareSquareDConvolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_4/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_4/bias/Regularizer/SumSum1Convolutional_Layer_4/bias/Regularizer/Square:y:05Convolutional_Layer_4/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_4/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_4/bias/Regularizer/mulMul5Convolutional_Layer_4/bias/Regularizer/mul/x:output:03Convolutional_Layer_4/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: l
IdentityIdentity.Convolutional_Layer_4/bias/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp=^Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2|
<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp
�
�
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_7514

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_6480

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_7861

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_2528

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
__inference_loss_fn_10_8179a
Gconvolutional_layer_5_kernel_regularizer_square_readvariableop_resource:
identity��>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp�
>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOpReadVariableOpGconvolutional_layer_5_kernel_regularizer_square_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_5/kernel/Regularizer/SquareSquareFConvolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_5/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_5/kernel/Regularizer/SumSum3Convolutional_Layer_5/kernel/Regularizer/Square:y:07Convolutional_Layer_5/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_5/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_5/kernel/Regularizer/mulMul7Convolutional_Layer_5/kernel/Regularizer/mul/x:output:05Convolutional_Layer_5/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: n
IdentityIdentity0Convolutional_Layer_5/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp?^Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2�
>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp
�
�
__inference_loss_fn_23_8322J
;policy_head_bias_regularizer_square_readvariableop_resource:	�
identity��2Policy_Head/bias/Regularizer/Square/ReadVariableOp�
2Policy_Head/bias/Regularizer/Square/ReadVariableOpReadVariableOp;policy_head_bias_regularizer_square_readvariableop_resource*
_output_shapes	
:�*
dtype0�
#Policy_Head/bias/Regularizer/SquareSquare:Policy_Head/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes	
:�l
"Policy_Head/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
 Policy_Head/bias/Regularizer/SumSum'Policy_Head/bias/Regularizer/Square:y:0+Policy_Head/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: g
"Policy_Head/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
 Policy_Head/bias/Regularizer/mulMul+Policy_Head/bias/Regularizer/mul/x:output:0)Policy_Head/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: b
IdentityIdentity$Policy_Head/bias/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: {
NoOpNoOp3^Policy_Head/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2h
2Policy_Head/bias/Regularizer/Square/ReadVariableOp2Policy_Head/bias/Regularizer/Square/ReadVariableOp
�
�
"__inference_signature_wrapper_5270
input_2"
unknown:�
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:#
	unknown_5:
	unknown_6:
	unknown_7:
	unknown_8:
	unknown_9:

unknown_10:$

unknown_11:

unknown_12:

unknown_13:

unknown_14:

unknown_15:

unknown_16:$

unknown_17:

unknown_18:

unknown_19:

unknown_20:

unknown_21:

unknown_22:$

unknown_23:

unknown_24:

unknown_25:

unknown_26:

unknown_27:

unknown_28:$

unknown_29:

unknown_30:

unknown_31:

unknown_32:

unknown_33:

unknown_34:$

unknown_35:

unknown_36:$

unknown_37:

unknown_38:

unknown_39:

unknown_40:

unknown_41:

unknown_42:

unknown_43:

unknown_44:

unknown_45:

unknown_46:$

unknown_47:

unknown_48:

unknown_49:

unknown_50:

unknown_51:

unknown_52:

unknown_53:?@

unknown_54:@

unknown_55:@

unknown_56:@

unknown_57:@

unknown_58:@

unknown_59:	?�

unknown_60:	�

unknown_61:@

unknown_62:
identity

identity_1��StatefulPartitionedCall�	
StatefulPartitionedCallStatefulPartitionedCallinput_2unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32
unknown_33
unknown_34
unknown_35
unknown_36
unknown_37
unknown_38
unknown_39
unknown_40
unknown_41
unknown_42
unknown_43
unknown_44
unknown_45
unknown_46
unknown_47
unknown_48
unknown_49
unknown_50
unknown_51
unknown_52
unknown_53
unknown_54
unknown_55
unknown_56
unknown_57
unknown_58
unknown_59
unknown_60
unknown_61
unknown_62*L
TinE
C2A*
Tout
2*
_collective_manager_ids
 *;
_output_shapes)
':����������:���������*b
_read_only_resource_inputsD
B@	
 !"#$%&'()*+,-./0123456789:;<=>?@*-
config_proto

CPU

GPU 2J 8� *(
f#R!
__inference__wrapped_model_1593p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:����������q

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������	�: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Y U
0
_output_shapes
:���������	�
!
_user_specified_name	input_2
�	
�
4__inference_Batch_Normalization_0_layer_call_fn_6382

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_1646�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_7656

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Convolutional_Layer_1_layer_call_and_return_conditional_losses_6524

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������	�
>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_1/kernel/Regularizer/SquareSquareFConvolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_1/kernel/Regularizer/SumSum3Convolutional_Layer_1/kernel/Regularizer/Square:y:07Convolutional_Layer_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_1/kernel/Regularizer/mulMul7Convolutional_Layer_1/kernel/Regularizer/mul/x:output:05Convolutional_Layer_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_1/bias/Regularizer/SquareSquareDConvolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_1/bias/Regularizer/SumSum1Convolutional_Layer_1/bias/Regularizer/Square:y:05Convolutional_Layer_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_1/bias/Regularizer/mulMul5Convolutional_Layer_1/bias/Regularizer/mul/x:output:03Convolutional_Layer_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp=^Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2|
<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_6966

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�	
�
4__inference_Batch_Normalization_4_layer_call_fn_7054

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_1902�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
O__inference_Convolutional_Layer_3_layer_call_and_return_conditional_losses_6860

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������	�
>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_3/kernel/Regularizer/SquareSquareFConvolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_3/kernel/Regularizer/SumSum3Convolutional_Layer_3/kernel/Regularizer/Square:y:07Convolutional_Layer_3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_3/kernel/Regularizer/mulMul7Convolutional_Layer_3/kernel/Regularizer/mul/x:output:05Convolutional_Layer_3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_3/bias/Regularizer/SquareSquareDConvolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_3/bias/Regularizer/SumSum1Convolutional_Layer_3/bias/Regularizer/Square:y:05Convolutional_Layer_3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_3/bias/Regularizer/mulMul5Convolutional_Layer_3/bias/Regularizer/mul/x:output:03Convolutional_Layer_3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp=^Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2|
<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
4__inference_Convolutional_Layer_4_layer_call_fn_7005

inputs!
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_4_layer_call_and_return_conditional_losses_2505w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�	
�
4__inference_Batch_Normalization_0_layer_call_fn_6369

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_1615�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_1774

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_6762

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�	
�
4__inference_Batch_Normalization_2_layer_call_fn_6705

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_1743�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
V__inference_Policy_Convolutional_Layer_2_layer_call_and_return_conditional_losses_7711

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp�EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������	�
EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
6Policy_Convolutional_Layer_2/kernel/Regularizer/SquareSquareMPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
5Policy_Convolutional_Layer_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3Policy_Convolutional_Layer_2/kernel/Regularizer/SumSum:Policy_Convolutional_Layer_2/kernel/Regularizer/Square:y:0>Policy_Convolutional_Layer_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5Policy_Convolutional_Layer_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
3Policy_Convolutional_Layer_2/kernel/Regularizer/mulMul>Policy_Convolutional_Layer_2/kernel/Regularizer/mul/x:output:0<Policy_Convolutional_Layer_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
4Policy_Convolutional_Layer_2/bias/Regularizer/SquareSquareKPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:}
3Policy_Convolutional_Layer_2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
1Policy_Convolutional_Layer_2/bias/Regularizer/SumSum8Policy_Convolutional_Layer_2/bias/Regularizer/Square:y:0<Policy_Convolutional_Layer_2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: x
3Policy_Convolutional_Layer_2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
1Policy_Convolutional_Layer_2/bias/Regularizer/mulMul<Policy_Convolutional_Layer_2/bias/Regularizer/mul/x:output:0:Policy_Convolutional_Layer_2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOpD^Policy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpF^Policy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2�
CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpCPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp2�
EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpEPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_6444

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_7843

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
&__inference_model_1_layer_call_fn_3153
input_2"
unknown:�
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:#
	unknown_5:
	unknown_6:
	unknown_7:
	unknown_8:
	unknown_9:

unknown_10:$

unknown_11:

unknown_12:

unknown_13:

unknown_14:

unknown_15:

unknown_16:$

unknown_17:

unknown_18:

unknown_19:

unknown_20:

unknown_21:

unknown_22:$

unknown_23:

unknown_24:

unknown_25:

unknown_26:

unknown_27:

unknown_28:$

unknown_29:

unknown_30:

unknown_31:

unknown_32:

unknown_33:

unknown_34:$

unknown_35:

unknown_36:$

unknown_37:

unknown_38:

unknown_39:

unknown_40:

unknown_41:

unknown_42:

unknown_43:

unknown_44:

unknown_45:

unknown_46:$

unknown_47:

unknown_48:

unknown_49:

unknown_50:

unknown_51:

unknown_52:

unknown_53:?@

unknown_54:@

unknown_55:@

unknown_56:@

unknown_57:@

unknown_58:@

unknown_59:	?�

unknown_60:	�

unknown_61:@

unknown_62:
identity

identity_1��StatefulPartitionedCall�	
StatefulPartitionedCallStatefulPartitionedCallinput_2unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32
unknown_33
unknown_34
unknown_35
unknown_36
unknown_37
unknown_38
unknown_39
unknown_40
unknown_41
unknown_42
unknown_43
unknown_44
unknown_45
unknown_46
unknown_47
unknown_48
unknown_49
unknown_50
unknown_51
unknown_52
unknown_53
unknown_54
unknown_55
unknown_56
unknown_57
unknown_58
unknown_59
unknown_60
unknown_61
unknown_62*L
TinE
C2A*
Tout
2*
_collective_manager_ids
 *;
_output_shapes)
':���������:����������*b
_read_only_resource_inputsD
B@	
 !"#$%&'()*+,-./0123456789:;<=>?@*-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_model_1_layer_call_and_return_conditional_losses_3020o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������r

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*(
_output_shapes
:����������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������	�: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Y U
0
_output_shapes
:���������	�
!
_user_specified_name	input_2
�
�
8__inference_Value_Convolutional_Layer_layer_call_fn_7341

inputs!
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *\
fWRU
S__inference_Value_Convolutional_Layer_layer_call_and_return_conditional_losses_2646w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�	
�
4__inference_Batch_Normalization_3_layer_call_fn_6886

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_1838�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_6984

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_7478

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_6798

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
O
3__inference_Policy_Flatten_Layer_layer_call_fn_7964

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *W
fRRP
N__inference_Policy_Flatten_Layer_layer_call_and_return_conditional_losses_2805`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:���������?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
4__inference_Batch_Normalization_2_layer_call_fn_6744

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_3552w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
)__inference_Value_Head_layer_call_fn_7991

inputs
unknown:@
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_Value_Head_layer_call_and_return_conditional_losses_2868o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������@: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
�
�
__inference_loss_fn_19_8278O
Avalue_dense_layer_bias_regularizer_square_readvariableop_resource:@
identity��8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp�
8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOpReadVariableOpAvalue_dense_layer_bias_regularizer_square_readvariableop_resource*
_output_shapes
:@*
dtype0�
)Value_Dense_Layer/bias/Regularizer/SquareSquare@Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:@r
(Value_Dense_Layer/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
&Value_Dense_Layer/bias/Regularizer/SumSum-Value_Dense_Layer/bias/Regularizer/Square:y:01Value_Dense_Layer/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: m
(Value_Dense_Layer/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
&Value_Dense_Layer/bias/Regularizer/mulMul1Value_Dense_Layer/bias/Regularizer/mul/x:output:0/Value_Dense_Layer/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: h
IdentityIdentity*Value_Dense_Layer/bias/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp9^Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2t
8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp
�
�
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_1679

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_7638

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
4__inference_Batch_Normalization_5_layer_call_fn_7248

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_3390w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_2030

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_7496

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_6780

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
4__inference_Convolutional_Layer_0_layer_call_fn_6333

inputs"
unknown:�
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_0_layer_call_and_return_conditional_losses_2281w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :���������	�: : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:���������	�
 
_user_specified_nameinputs
ͬ
�J
A__inference_model_1_layer_call_and_return_conditional_losses_5919

inputsO
4convolutional_layer_0_conv2d_readvariableop_resource:�C
5convolutional_layer_0_biasadd_readvariableop_resource:;
-batch_normalization_0_readvariableop_resource:=
/batch_normalization_0_readvariableop_1_resource:L
>batch_normalization_0_fusedbatchnormv3_readvariableop_resource:N
@batch_normalization_0_fusedbatchnormv3_readvariableop_1_resource:N
4convolutional_layer_1_conv2d_readvariableop_resource:C
5convolutional_layer_1_biasadd_readvariableop_resource:;
-batch_normalization_1_readvariableop_resource:=
/batch_normalization_1_readvariableop_1_resource:L
>batch_normalization_1_fusedbatchnormv3_readvariableop_resource:N
@batch_normalization_1_fusedbatchnormv3_readvariableop_1_resource:N
4convolutional_layer_2_conv2d_readvariableop_resource:C
5convolutional_layer_2_biasadd_readvariableop_resource:;
-batch_normalization_2_readvariableop_resource:=
/batch_normalization_2_readvariableop_1_resource:L
>batch_normalization_2_fusedbatchnormv3_readvariableop_resource:N
@batch_normalization_2_fusedbatchnormv3_readvariableop_1_resource:N
4convolutional_layer_3_conv2d_readvariableop_resource:C
5convolutional_layer_3_biasadd_readvariableop_resource:;
-batch_normalization_3_readvariableop_resource:=
/batch_normalization_3_readvariableop_1_resource:L
>batch_normalization_3_fusedbatchnormv3_readvariableop_resource:N
@batch_normalization_3_fusedbatchnormv3_readvariableop_1_resource:N
4convolutional_layer_4_conv2d_readvariableop_resource:C
5convolutional_layer_4_biasadd_readvariableop_resource:;
-batch_normalization_4_readvariableop_resource:=
/batch_normalization_4_readvariableop_1_resource:L
>batch_normalization_4_fusedbatchnormv3_readvariableop_resource:N
@batch_normalization_4_fusedbatchnormv3_readvariableop_1_resource:N
4convolutional_layer_5_conv2d_readvariableop_resource:C
5convolutional_layer_5_biasadd_readvariableop_resource:;
-batch_normalization_5_readvariableop_resource:=
/batch_normalization_5_readvariableop_1_resource:L
>batch_normalization_5_fusedbatchnormv3_readvariableop_resource:N
@batch_normalization_5_fusedbatchnormv3_readvariableop_1_resource:U
;policy_convolutional_layer_1_conv2d_readvariableop_resource:J
<policy_convolutional_layer_1_biasadd_readvariableop_resource:R
8value_convolutional_layer_conv2d_readvariableop_resource:G
9value_convolutional_layer_biasadd_readvariableop_resource:B
4policy_batch_normalization_1_readvariableop_resource:D
6policy_batch_normalization_1_readvariableop_1_resource:S
Epolicy_batch_normalization_1_fusedbatchnormv3_readvariableop_resource:U
Gpolicy_batch_normalization_1_fusedbatchnormv3_readvariableop_1_resource:A
3value_batch_normalization_1_readvariableop_resource:C
5value_batch_normalization_1_readvariableop_1_resource:R
Dvalue_batch_normalization_1_fusedbatchnormv3_readvariableop_resource:T
Fvalue_batch_normalization_1_fusedbatchnormv3_readvariableop_1_resource:U
;policy_convolutional_layer_2_conv2d_readvariableop_resource:J
<policy_convolutional_layer_2_biasadd_readvariableop_resource:B
4policy_batch_normalization_2_readvariableop_resource:D
6policy_batch_normalization_2_readvariableop_1_resource:S
Epolicy_batch_normalization_2_fusedbatchnormv3_readvariableop_resource:U
Gpolicy_batch_normalization_2_fusedbatchnormv3_readvariableop_1_resource:B
0value_dense_layer_matmul_readvariableop_resource:?@?
1value_dense_layer_biasadd_readvariableop_resource:@K
=value_batch_normalization_2_batchnorm_readvariableop_resource:@O
Avalue_batch_normalization_2_batchnorm_mul_readvariableop_resource:@M
?value_batch_normalization_2_batchnorm_readvariableop_1_resource:@M
?value_batch_normalization_2_batchnorm_readvariableop_2_resource:@=
*policy_head_matmul_readvariableop_resource:	?�:
+policy_head_biasadd_readvariableop_resource:	�;
)value_head_matmul_readvariableop_resource:@8
*value_head_biasadd_readvariableop_resource:
identity

identity_1��5Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp�7Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp_1�$Batch_Normalization_0/ReadVariableOp�&Batch_Normalization_0/ReadVariableOp_1�5Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp�7Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1�$Batch_Normalization_1/ReadVariableOp�&Batch_Normalization_1/ReadVariableOp_1�5Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp�7Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1�$Batch_Normalization_2/ReadVariableOp�&Batch_Normalization_2/ReadVariableOp_1�5Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp�7Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp_1�$Batch_Normalization_3/ReadVariableOp�&Batch_Normalization_3/ReadVariableOp_1�5Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp�7Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp_1�$Batch_Normalization_4/ReadVariableOp�&Batch_Normalization_4/ReadVariableOp_1�5Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp�7Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp_1�$Batch_Normalization_5/ReadVariableOp�&Batch_Normalization_5/ReadVariableOp_1�,Convolutional_Layer_0/BiasAdd/ReadVariableOp�+Convolutional_Layer_0/Conv2D/ReadVariableOp�<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp�,Convolutional_Layer_1/BiasAdd/ReadVariableOp�+Convolutional_Layer_1/Conv2D/ReadVariableOp�<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp�,Convolutional_Layer_2/BiasAdd/ReadVariableOp�+Convolutional_Layer_2/Conv2D/ReadVariableOp�<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp�,Convolutional_Layer_3/BiasAdd/ReadVariableOp�+Convolutional_Layer_3/Conv2D/ReadVariableOp�<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp�,Convolutional_Layer_4/BiasAdd/ReadVariableOp�+Convolutional_Layer_4/Conv2D/ReadVariableOp�<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp�,Convolutional_Layer_5/BiasAdd/ReadVariableOp�+Convolutional_Layer_5/Conv2D/ReadVariableOp�<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp�<Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp�>Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1�+Policy_Batch_Normalization_1/ReadVariableOp�-Policy_Batch_Normalization_1/ReadVariableOp_1�<Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp�>Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1�+Policy_Batch_Normalization_2/ReadVariableOp�-Policy_Batch_Normalization_2/ReadVariableOp_1�3Policy_Convolutional_Layer_1/BiasAdd/ReadVariableOp�2Policy_Convolutional_Layer_1/Conv2D/ReadVariableOp�CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp�EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp�3Policy_Convolutional_Layer_2/BiasAdd/ReadVariableOp�2Policy_Convolutional_Layer_2/Conv2D/ReadVariableOp�CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp�EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp�"Policy_Head/BiasAdd/ReadVariableOp�!Policy_Head/MatMul/ReadVariableOp�2Policy_Head/bias/Regularizer/Square/ReadVariableOp�4Policy_Head/kernel/Regularizer/Square/ReadVariableOp�;Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp�=Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1�*Value_Batch_Normalization_1/ReadVariableOp�,Value_Batch_Normalization_1/ReadVariableOp_1�4Value_Batch_Normalization_2/batchnorm/ReadVariableOp�6Value_Batch_Normalization_2/batchnorm/ReadVariableOp_1�6Value_Batch_Normalization_2/batchnorm/ReadVariableOp_2�8Value_Batch_Normalization_2/batchnorm/mul/ReadVariableOp�0Value_Convolutional_Layer/BiasAdd/ReadVariableOp�/Value_Convolutional_Layer/Conv2D/ReadVariableOp�@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp�BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp�(Value_Dense_Layer/BiasAdd/ReadVariableOp�'Value_Dense_Layer/MatMul/ReadVariableOp�8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp�:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp�!Value_Head/BiasAdd/ReadVariableOp� Value_Head/MatMul/ReadVariableOp�1Value_Head/bias/Regularizer/Square/ReadVariableOp�3Value_Head/kernel/Regularizer/Square/ReadVariableOp�
+Convolutional_Layer_0/Conv2D/ReadVariableOpReadVariableOp4convolutional_layer_0_conv2d_readvariableop_resource*'
_output_shapes
:�*
dtype0�
Convolutional_Layer_0/Conv2DConv2Dinputs3Convolutional_Layer_0/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
,Convolutional_Layer_0/BiasAdd/ReadVariableOpReadVariableOp5convolutional_layer_0_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
Convolutional_Layer_0/BiasAddBiasAdd%Convolutional_Layer_0/Conv2D:output:04Convolutional_Layer_0/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
Convolutional_Layer_0/ReluRelu&Convolutional_Layer_0/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
$Batch_Normalization_0/ReadVariableOpReadVariableOp-batch_normalization_0_readvariableop_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_0/ReadVariableOp_1ReadVariableOp/batch_normalization_0_readvariableop_1_resource*
_output_shapes
:*
dtype0�
5Batch_Normalization_0/FusedBatchNormV3/ReadVariableOpReadVariableOp>batch_normalization_0_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
7Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp@batch_normalization_0_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_0/FusedBatchNormV3FusedBatchNormV3(Convolutional_Layer_0/Relu:activations:0,Batch_Normalization_0/ReadVariableOp:value:0.Batch_Normalization_0/ReadVariableOp_1:value:0=Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp:value:0?Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( �
+Convolutional_Layer_1/Conv2D/ReadVariableOpReadVariableOp4convolutional_layer_1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Convolutional_Layer_1/Conv2DConv2D*Batch_Normalization_0/FusedBatchNormV3:y:03Convolutional_Layer_1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
,Convolutional_Layer_1/BiasAdd/ReadVariableOpReadVariableOp5convolutional_layer_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
Convolutional_Layer_1/BiasAddBiasAdd%Convolutional_Layer_1/Conv2D:output:04Convolutional_Layer_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
Convolutional_Layer_1/ReluRelu&Convolutional_Layer_1/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
$Batch_Normalization_1/ReadVariableOpReadVariableOp-batch_normalization_1_readvariableop_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_1/ReadVariableOp_1ReadVariableOp/batch_normalization_1_readvariableop_1_resource*
_output_shapes
:*
dtype0�
5Batch_Normalization_1/FusedBatchNormV3/ReadVariableOpReadVariableOp>batch_normalization_1_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
7Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp@batch_normalization_1_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_1/FusedBatchNormV3FusedBatchNormV3(Convolutional_Layer_1/Relu:activations:0,Batch_Normalization_1/ReadVariableOp:value:0.Batch_Normalization_1/ReadVariableOp_1:value:0=Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp:value:0?Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( �
+Convolutional_Layer_2/Conv2D/ReadVariableOpReadVariableOp4convolutional_layer_2_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Convolutional_Layer_2/Conv2DConv2D*Batch_Normalization_1/FusedBatchNormV3:y:03Convolutional_Layer_2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
,Convolutional_Layer_2/BiasAdd/ReadVariableOpReadVariableOp5convolutional_layer_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
Convolutional_Layer_2/BiasAddBiasAdd%Convolutional_Layer_2/Conv2D:output:04Convolutional_Layer_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
Convolutional_Layer_2/ReluRelu&Convolutional_Layer_2/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
$Batch_Normalization_2/ReadVariableOpReadVariableOp-batch_normalization_2_readvariableop_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_2/ReadVariableOp_1ReadVariableOp/batch_normalization_2_readvariableop_1_resource*
_output_shapes
:*
dtype0�
5Batch_Normalization_2/FusedBatchNormV3/ReadVariableOpReadVariableOp>batch_normalization_2_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
7Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp@batch_normalization_2_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_2/FusedBatchNormV3FusedBatchNormV3(Convolutional_Layer_2/Relu:activations:0,Batch_Normalization_2/ReadVariableOp:value:0.Batch_Normalization_2/ReadVariableOp_1:value:0=Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp:value:0?Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( �
+Convolutional_Layer_3/Conv2D/ReadVariableOpReadVariableOp4convolutional_layer_3_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Convolutional_Layer_3/Conv2DConv2D*Batch_Normalization_2/FusedBatchNormV3:y:03Convolutional_Layer_3/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
,Convolutional_Layer_3/BiasAdd/ReadVariableOpReadVariableOp5convolutional_layer_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
Convolutional_Layer_3/BiasAddBiasAdd%Convolutional_Layer_3/Conv2D:output:04Convolutional_Layer_3/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
Convolutional_Layer_3/ReluRelu&Convolutional_Layer_3/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
$Batch_Normalization_3/ReadVariableOpReadVariableOp-batch_normalization_3_readvariableop_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_3/ReadVariableOp_1ReadVariableOp/batch_normalization_3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
5Batch_Normalization_3/FusedBatchNormV3/ReadVariableOpReadVariableOp>batch_normalization_3_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
7Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp@batch_normalization_3_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_3/FusedBatchNormV3FusedBatchNormV3(Convolutional_Layer_3/Relu:activations:0,Batch_Normalization_3/ReadVariableOp:value:0.Batch_Normalization_3/ReadVariableOp_1:value:0=Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp:value:0?Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( �
+Convolutional_Layer_4/Conv2D/ReadVariableOpReadVariableOp4convolutional_layer_4_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Convolutional_Layer_4/Conv2DConv2D*Batch_Normalization_3/FusedBatchNormV3:y:03Convolutional_Layer_4/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
,Convolutional_Layer_4/BiasAdd/ReadVariableOpReadVariableOp5convolutional_layer_4_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
Convolutional_Layer_4/BiasAddBiasAdd%Convolutional_Layer_4/Conv2D:output:04Convolutional_Layer_4/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
Convolutional_Layer_4/ReluRelu&Convolutional_Layer_4/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
$Batch_Normalization_4/ReadVariableOpReadVariableOp-batch_normalization_4_readvariableop_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_4/ReadVariableOp_1ReadVariableOp/batch_normalization_4_readvariableop_1_resource*
_output_shapes
:*
dtype0�
5Batch_Normalization_4/FusedBatchNormV3/ReadVariableOpReadVariableOp>batch_normalization_4_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
7Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp@batch_normalization_4_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_4/FusedBatchNormV3FusedBatchNormV3(Convolutional_Layer_4/Relu:activations:0,Batch_Normalization_4/ReadVariableOp:value:0.Batch_Normalization_4/ReadVariableOp_1:value:0=Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp:value:0?Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( �
+Convolutional_Layer_5/Conv2D/ReadVariableOpReadVariableOp4convolutional_layer_5_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Convolutional_Layer_5/Conv2DConv2D*Batch_Normalization_4/FusedBatchNormV3:y:03Convolutional_Layer_5/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
,Convolutional_Layer_5/BiasAdd/ReadVariableOpReadVariableOp5convolutional_layer_5_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
Convolutional_Layer_5/BiasAddBiasAdd%Convolutional_Layer_5/Conv2D:output:04Convolutional_Layer_5/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
Convolutional_Layer_5/ReluRelu&Convolutional_Layer_5/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
$Batch_Normalization_5/ReadVariableOpReadVariableOp-batch_normalization_5_readvariableop_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_5/ReadVariableOp_1ReadVariableOp/batch_normalization_5_readvariableop_1_resource*
_output_shapes
:*
dtype0�
5Batch_Normalization_5/FusedBatchNormV3/ReadVariableOpReadVariableOp>batch_normalization_5_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
7Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp@batch_normalization_5_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_5/FusedBatchNormV3FusedBatchNormV3(Convolutional_Layer_5/Relu:activations:0,Batch_Normalization_5/ReadVariableOp:value:0.Batch_Normalization_5/ReadVariableOp_1:value:0=Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp:value:0?Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( �
2Policy_Convolutional_Layer_1/Conv2D/ReadVariableOpReadVariableOp;policy_convolutional_layer_1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
#Policy_Convolutional_Layer_1/Conv2DConv2D*Batch_Normalization_5/FusedBatchNormV3:y:0:Policy_Convolutional_Layer_1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
3Policy_Convolutional_Layer_1/BiasAdd/ReadVariableOpReadVariableOp<policy_convolutional_layer_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
$Policy_Convolutional_Layer_1/BiasAddBiasAdd,Policy_Convolutional_Layer_1/Conv2D:output:0;Policy_Convolutional_Layer_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
!Policy_Convolutional_Layer_1/ReluRelu-Policy_Convolutional_Layer_1/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
/Value_Convolutional_Layer/Conv2D/ReadVariableOpReadVariableOp8value_convolutional_layer_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
 Value_Convolutional_Layer/Conv2DConv2D*Batch_Normalization_5/FusedBatchNormV3:y:07Value_Convolutional_Layer/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
0Value_Convolutional_Layer/BiasAdd/ReadVariableOpReadVariableOp9value_convolutional_layer_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
!Value_Convolutional_Layer/BiasAddBiasAdd)Value_Convolutional_Layer/Conv2D:output:08Value_Convolutional_Layer/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
Value_Convolutional_Layer/ReluRelu*Value_Convolutional_Layer/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
+Policy_Batch_Normalization_1/ReadVariableOpReadVariableOp4policy_batch_normalization_1_readvariableop_resource*
_output_shapes
:*
dtype0�
-Policy_Batch_Normalization_1/ReadVariableOp_1ReadVariableOp6policy_batch_normalization_1_readvariableop_1_resource*
_output_shapes
:*
dtype0�
<Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOpReadVariableOpEpolicy_batch_normalization_1_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
>Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpGpolicy_batch_normalization_1_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
-Policy_Batch_Normalization_1/FusedBatchNormV3FusedBatchNormV3/Policy_Convolutional_Layer_1/Relu:activations:03Policy_Batch_Normalization_1/ReadVariableOp:value:05Policy_Batch_Normalization_1/ReadVariableOp_1:value:0DPolicy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp:value:0FPolicy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( �
*Value_Batch_Normalization_1/ReadVariableOpReadVariableOp3value_batch_normalization_1_readvariableop_resource*
_output_shapes
:*
dtype0�
,Value_Batch_Normalization_1/ReadVariableOp_1ReadVariableOp5value_batch_normalization_1_readvariableop_1_resource*
_output_shapes
:*
dtype0�
;Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOpReadVariableOpDvalue_batch_normalization_1_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
=Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpFvalue_batch_normalization_1_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
,Value_Batch_Normalization_1/FusedBatchNormV3FusedBatchNormV3,Value_Convolutional_Layer/Relu:activations:02Value_Batch_Normalization_1/ReadVariableOp:value:04Value_Batch_Normalization_1/ReadVariableOp_1:value:0CValue_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp:value:0EValue_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( �
2Policy_Convolutional_Layer_2/Conv2D/ReadVariableOpReadVariableOp;policy_convolutional_layer_2_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
#Policy_Convolutional_Layer_2/Conv2DConv2D1Policy_Batch_Normalization_1/FusedBatchNormV3:y:0:Policy_Convolutional_Layer_2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
3Policy_Convolutional_Layer_2/BiasAdd/ReadVariableOpReadVariableOp<policy_convolutional_layer_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
$Policy_Convolutional_Layer_2/BiasAddBiasAdd,Policy_Convolutional_Layer_2/Conv2D:output:0;Policy_Convolutional_Layer_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
!Policy_Convolutional_Layer_2/ReluRelu-Policy_Convolutional_Layer_2/BiasAdd:output:0*
T0*/
_output_shapes
:���������	j
Value_Flatten_Layer/ConstConst*
_output_shapes
:*
dtype0*
valueB"����?   �
Value_Flatten_Layer/ReshapeReshape0Value_Batch_Normalization_1/FusedBatchNormV3:y:0"Value_Flatten_Layer/Const:output:0*
T0*'
_output_shapes
:���������?�
+Policy_Batch_Normalization_2/ReadVariableOpReadVariableOp4policy_batch_normalization_2_readvariableop_resource*
_output_shapes
:*
dtype0�
-Policy_Batch_Normalization_2/ReadVariableOp_1ReadVariableOp6policy_batch_normalization_2_readvariableop_1_resource*
_output_shapes
:*
dtype0�
<Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOpReadVariableOpEpolicy_batch_normalization_2_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
>Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpGpolicy_batch_normalization_2_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
-Policy_Batch_Normalization_2/FusedBatchNormV3FusedBatchNormV3/Policy_Convolutional_Layer_2/Relu:activations:03Policy_Batch_Normalization_2/ReadVariableOp:value:05Policy_Batch_Normalization_2/ReadVariableOp_1:value:0DPolicy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp:value:0FPolicy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( �
'Value_Dense_Layer/MatMul/ReadVariableOpReadVariableOp0value_dense_layer_matmul_readvariableop_resource*
_output_shapes

:?@*
dtype0�
Value_Dense_Layer/MatMulMatMul$Value_Flatten_Layer/Reshape:output:0/Value_Dense_Layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@�
(Value_Dense_Layer/BiasAdd/ReadVariableOpReadVariableOp1value_dense_layer_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
Value_Dense_Layer/BiasAddBiasAdd"Value_Dense_Layer/MatMul:product:00Value_Dense_Layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@t
Value_Dense_Layer/ReluRelu"Value_Dense_Layer/BiasAdd:output:0*
T0*'
_output_shapes
:���������@k
Policy_Flatten_Layer/ConstConst*
_output_shapes
:*
dtype0*
valueB"����?   �
Policy_Flatten_Layer/ReshapeReshape1Policy_Batch_Normalization_2/FusedBatchNormV3:y:0#Policy_Flatten_Layer/Const:output:0*
T0*'
_output_shapes
:���������?�
4Value_Batch_Normalization_2/batchnorm/ReadVariableOpReadVariableOp=value_batch_normalization_2_batchnorm_readvariableop_resource*
_output_shapes
:@*
dtype0p
+Value_Batch_Normalization_2/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:�
)Value_Batch_Normalization_2/batchnorm/addAddV2<Value_Batch_Normalization_2/batchnorm/ReadVariableOp:value:04Value_Batch_Normalization_2/batchnorm/add/y:output:0*
T0*
_output_shapes
:@�
+Value_Batch_Normalization_2/batchnorm/RsqrtRsqrt-Value_Batch_Normalization_2/batchnorm/add:z:0*
T0*
_output_shapes
:@�
8Value_Batch_Normalization_2/batchnorm/mul/ReadVariableOpReadVariableOpAvalue_batch_normalization_2_batchnorm_mul_readvariableop_resource*
_output_shapes
:@*
dtype0�
)Value_Batch_Normalization_2/batchnorm/mulMul/Value_Batch_Normalization_2/batchnorm/Rsqrt:y:0@Value_Batch_Normalization_2/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:@�
+Value_Batch_Normalization_2/batchnorm/mul_1Mul$Value_Dense_Layer/Relu:activations:0-Value_Batch_Normalization_2/batchnorm/mul:z:0*
T0*'
_output_shapes
:���������@�
6Value_Batch_Normalization_2/batchnorm/ReadVariableOp_1ReadVariableOp?value_batch_normalization_2_batchnorm_readvariableop_1_resource*
_output_shapes
:@*
dtype0�
+Value_Batch_Normalization_2/batchnorm/mul_2Mul>Value_Batch_Normalization_2/batchnorm/ReadVariableOp_1:value:0-Value_Batch_Normalization_2/batchnorm/mul:z:0*
T0*
_output_shapes
:@�
6Value_Batch_Normalization_2/batchnorm/ReadVariableOp_2ReadVariableOp?value_batch_normalization_2_batchnorm_readvariableop_2_resource*
_output_shapes
:@*
dtype0�
)Value_Batch_Normalization_2/batchnorm/subSub>Value_Batch_Normalization_2/batchnorm/ReadVariableOp_2:value:0/Value_Batch_Normalization_2/batchnorm/mul_2:z:0*
T0*
_output_shapes
:@�
+Value_Batch_Normalization_2/batchnorm/add_1AddV2/Value_Batch_Normalization_2/batchnorm/mul_1:z:0-Value_Batch_Normalization_2/batchnorm/sub:z:0*
T0*'
_output_shapes
:���������@�
!Policy_Head/MatMul/ReadVariableOpReadVariableOp*policy_head_matmul_readvariableop_resource*
_output_shapes
:	?�*
dtype0�
Policy_Head/MatMulMatMul%Policy_Flatten_Layer/Reshape:output:0)Policy_Head/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
"Policy_Head/BiasAdd/ReadVariableOpReadVariableOp+policy_head_biasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0�
Policy_Head/BiasAddBiasAddPolicy_Head/MatMul:product:0*Policy_Head/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������o
Policy_Head/SoftmaxSoftmaxPolicy_Head/BiasAdd:output:0*
T0*(
_output_shapes
:�����������
 Value_Head/MatMul/ReadVariableOpReadVariableOp)value_head_matmul_readvariableop_resource*
_output_shapes

:@*
dtype0�
Value_Head/MatMulMatMul/Value_Batch_Normalization_2/batchnorm/add_1:z:0(Value_Head/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
!Value_Head/BiasAdd/ReadVariableOpReadVariableOp*value_head_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
Value_Head/BiasAddBiasAddValue_Head/MatMul:product:0)Value_Head/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������f
Value_Head/TanhTanhValue_Head/BiasAdd:output:0*
T0*'
_output_shapes
:����������
>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOpReadVariableOp4convolutional_layer_0_conv2d_readvariableop_resource*'
_output_shapes
:�*
dtype0�
/Convolutional_Layer_0/kernel/Regularizer/SquareSquareFConvolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*'
_output_shapes
:��
.Convolutional_Layer_0/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_0/kernel/Regularizer/SumSum3Convolutional_Layer_0/kernel/Regularizer/Square:y:07Convolutional_Layer_0/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_0/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_0/kernel/Regularizer/mulMul7Convolutional_Layer_0/kernel/Regularizer/mul/x:output:05Convolutional_Layer_0/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOpReadVariableOp5convolutional_layer_0_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_0/bias/Regularizer/SquareSquareDConvolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_0/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_0/bias/Regularizer/SumSum1Convolutional_Layer_0/bias/Regularizer/Square:y:05Convolutional_Layer_0/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_0/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_0/bias/Regularizer/mulMul5Convolutional_Layer_0/bias/Regularizer/mul/x:output:03Convolutional_Layer_0/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp4convolutional_layer_1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_1/kernel/Regularizer/SquareSquareFConvolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_1/kernel/Regularizer/SumSum3Convolutional_Layer_1/kernel/Regularizer/Square:y:07Convolutional_Layer_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_1/kernel/Regularizer/mulMul7Convolutional_Layer_1/kernel/Regularizer/mul/x:output:05Convolutional_Layer_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpReadVariableOp5convolutional_layer_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_1/bias/Regularizer/SquareSquareDConvolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_1/bias/Regularizer/SumSum1Convolutional_Layer_1/bias/Regularizer/Square:y:05Convolutional_Layer_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_1/bias/Regularizer/mulMul5Convolutional_Layer_1/bias/Regularizer/mul/x:output:03Convolutional_Layer_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp4convolutional_layer_2_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_2/kernel/Regularizer/SquareSquareFConvolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_2/kernel/Regularizer/SumSum3Convolutional_Layer_2/kernel/Regularizer/Square:y:07Convolutional_Layer_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_2/kernel/Regularizer/mulMul7Convolutional_Layer_2/kernel/Regularizer/mul/x:output:05Convolutional_Layer_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpReadVariableOp5convolutional_layer_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_2/bias/Regularizer/SquareSquareDConvolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_2/bias/Regularizer/SumSum1Convolutional_Layer_2/bias/Regularizer/Square:y:05Convolutional_Layer_2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_2/bias/Regularizer/mulMul5Convolutional_Layer_2/bias/Regularizer/mul/x:output:03Convolutional_Layer_2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOpReadVariableOp4convolutional_layer_3_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_3/kernel/Regularizer/SquareSquareFConvolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_3/kernel/Regularizer/SumSum3Convolutional_Layer_3/kernel/Regularizer/Square:y:07Convolutional_Layer_3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_3/kernel/Regularizer/mulMul7Convolutional_Layer_3/kernel/Regularizer/mul/x:output:05Convolutional_Layer_3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOpReadVariableOp5convolutional_layer_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_3/bias/Regularizer/SquareSquareDConvolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_3/bias/Regularizer/SumSum1Convolutional_Layer_3/bias/Regularizer/Square:y:05Convolutional_Layer_3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_3/bias/Regularizer/mulMul5Convolutional_Layer_3/bias/Regularizer/mul/x:output:03Convolutional_Layer_3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOpReadVariableOp4convolutional_layer_4_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_4/kernel/Regularizer/SquareSquareFConvolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_4/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_4/kernel/Regularizer/SumSum3Convolutional_Layer_4/kernel/Regularizer/Square:y:07Convolutional_Layer_4/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_4/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_4/kernel/Regularizer/mulMul7Convolutional_Layer_4/kernel/Regularizer/mul/x:output:05Convolutional_Layer_4/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOpReadVariableOp5convolutional_layer_4_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_4/bias/Regularizer/SquareSquareDConvolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_4/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_4/bias/Regularizer/SumSum1Convolutional_Layer_4/bias/Regularizer/Square:y:05Convolutional_Layer_4/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_4/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_4/bias/Regularizer/mulMul5Convolutional_Layer_4/bias/Regularizer/mul/x:output:03Convolutional_Layer_4/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOpReadVariableOp4convolutional_layer_5_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_5/kernel/Regularizer/SquareSquareFConvolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_5/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_5/kernel/Regularizer/SumSum3Convolutional_Layer_5/kernel/Regularizer/Square:y:07Convolutional_Layer_5/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_5/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_5/kernel/Regularizer/mulMul7Convolutional_Layer_5/kernel/Regularizer/mul/x:output:05Convolutional_Layer_5/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOpReadVariableOp5convolutional_layer_5_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_5/bias/Regularizer/SquareSquareDConvolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_5/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_5/bias/Regularizer/SumSum1Convolutional_Layer_5/bias/Regularizer/Square:y:05Convolutional_Layer_5/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_5/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_5/bias/Regularizer/mulMul5Convolutional_Layer_5/bias/Regularizer/mul/x:output:03Convolutional_Layer_5/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOpReadVariableOp8value_convolutional_layer_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
3Value_Convolutional_Layer/kernel/Regularizer/SquareSquareJValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
2Value_Convolutional_Layer/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
0Value_Convolutional_Layer/kernel/Regularizer/SumSum7Value_Convolutional_Layer/kernel/Regularizer/Square:y:0;Value_Convolutional_Layer/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: w
2Value_Convolutional_Layer/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
0Value_Convolutional_Layer/kernel/Regularizer/mulMul;Value_Convolutional_Layer/kernel/Regularizer/mul/x:output:09Value_Convolutional_Layer/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOpReadVariableOp9value_convolutional_layer_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
1Value_Convolutional_Layer/bias/Regularizer/SquareSquareHValue_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:z
0Value_Convolutional_Layer/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
.Value_Convolutional_Layer/bias/Regularizer/SumSum5Value_Convolutional_Layer/bias/Regularizer/Square:y:09Value_Convolutional_Layer/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: u
0Value_Convolutional_Layer/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
.Value_Convolutional_Layer/bias/Regularizer/mulMul9Value_Convolutional_Layer/bias/Regularizer/mul/x:output:07Value_Convolutional_Layer/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp;policy_convolutional_layer_1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
6Policy_Convolutional_Layer_1/kernel/Regularizer/SquareSquareMPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
5Policy_Convolutional_Layer_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3Policy_Convolutional_Layer_1/kernel/Regularizer/SumSum:Policy_Convolutional_Layer_1/kernel/Regularizer/Square:y:0>Policy_Convolutional_Layer_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5Policy_Convolutional_Layer_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
3Policy_Convolutional_Layer_1/kernel/Regularizer/mulMul>Policy_Convolutional_Layer_1/kernel/Regularizer/mul/x:output:0<Policy_Convolutional_Layer_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpReadVariableOp<policy_convolutional_layer_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
4Policy_Convolutional_Layer_1/bias/Regularizer/SquareSquareKPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:}
3Policy_Convolutional_Layer_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
1Policy_Convolutional_Layer_1/bias/Regularizer/SumSum8Policy_Convolutional_Layer_1/bias/Regularizer/Square:y:0<Policy_Convolutional_Layer_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: x
3Policy_Convolutional_Layer_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
1Policy_Convolutional_Layer_1/bias/Regularizer/mulMul<Policy_Convolutional_Layer_1/bias/Regularizer/mul/x:output:0:Policy_Convolutional_Layer_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp;policy_convolutional_layer_2_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
6Policy_Convolutional_Layer_2/kernel/Regularizer/SquareSquareMPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
5Policy_Convolutional_Layer_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3Policy_Convolutional_Layer_2/kernel/Regularizer/SumSum:Policy_Convolutional_Layer_2/kernel/Regularizer/Square:y:0>Policy_Convolutional_Layer_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5Policy_Convolutional_Layer_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
3Policy_Convolutional_Layer_2/kernel/Regularizer/mulMul>Policy_Convolutional_Layer_2/kernel/Regularizer/mul/x:output:0<Policy_Convolutional_Layer_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpReadVariableOp<policy_convolutional_layer_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
4Policy_Convolutional_Layer_2/bias/Regularizer/SquareSquareKPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:}
3Policy_Convolutional_Layer_2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
1Policy_Convolutional_Layer_2/bias/Regularizer/SumSum8Policy_Convolutional_Layer_2/bias/Regularizer/Square:y:0<Policy_Convolutional_Layer_2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: x
3Policy_Convolutional_Layer_2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
1Policy_Convolutional_Layer_2/bias/Regularizer/mulMul<Policy_Convolutional_Layer_2/bias/Regularizer/mul/x:output:0:Policy_Convolutional_Layer_2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOpReadVariableOp0value_dense_layer_matmul_readvariableop_resource*
_output_shapes

:?@*
dtype0�
+Value_Dense_Layer/kernel/Regularizer/SquareSquareBValue_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:?@{
*Value_Dense_Layer/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
(Value_Dense_Layer/kernel/Regularizer/SumSum/Value_Dense_Layer/kernel/Regularizer/Square:y:03Value_Dense_Layer/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: o
*Value_Dense_Layer/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
(Value_Dense_Layer/kernel/Regularizer/mulMul3Value_Dense_Layer/kernel/Regularizer/mul/x:output:01Value_Dense_Layer/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOpReadVariableOp1value_dense_layer_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
)Value_Dense_Layer/bias/Regularizer/SquareSquare@Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:@r
(Value_Dense_Layer/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
&Value_Dense_Layer/bias/Regularizer/SumSum-Value_Dense_Layer/bias/Regularizer/Square:y:01Value_Dense_Layer/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: m
(Value_Dense_Layer/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
&Value_Dense_Layer/bias/Regularizer/mulMul1Value_Dense_Layer/bias/Regularizer/mul/x:output:0/Value_Dense_Layer/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
3Value_Head/kernel/Regularizer/Square/ReadVariableOpReadVariableOp)value_head_matmul_readvariableop_resource*
_output_shapes

:@*
dtype0�
$Value_Head/kernel/Regularizer/SquareSquare;Value_Head/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@t
#Value_Head/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
!Value_Head/kernel/Regularizer/SumSum(Value_Head/kernel/Regularizer/Square:y:0,Value_Head/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: h
#Value_Head/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
!Value_Head/kernel/Regularizer/mulMul,Value_Head/kernel/Regularizer/mul/x:output:0*Value_Head/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
1Value_Head/bias/Regularizer/Square/ReadVariableOpReadVariableOp*value_head_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"Value_Head/bias/Regularizer/SquareSquare9Value_Head/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:k
!Value_Head/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
Value_Head/bias/Regularizer/SumSum&Value_Head/bias/Regularizer/Square:y:0*Value_Head/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: f
!Value_Head/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
Value_Head/bias/Regularizer/mulMul*Value_Head/bias/Regularizer/mul/x:output:0(Value_Head/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
4Policy_Head/kernel/Regularizer/Square/ReadVariableOpReadVariableOp*policy_head_matmul_readvariableop_resource*
_output_shapes
:	?�*
dtype0�
%Policy_Head/kernel/Regularizer/SquareSquare<Policy_Head/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?�u
$Policy_Head/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
"Policy_Head/kernel/Regularizer/SumSum)Policy_Head/kernel/Regularizer/Square:y:0-Policy_Head/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$Policy_Head/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
"Policy_Head/kernel/Regularizer/mulMul-Policy_Head/kernel/Regularizer/mul/x:output:0+Policy_Head/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
2Policy_Head/bias/Regularizer/Square/ReadVariableOpReadVariableOp+policy_head_biasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0�
#Policy_Head/bias/Regularizer/SquareSquare:Policy_Head/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes	
:�l
"Policy_Head/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
 Policy_Head/bias/Regularizer/SumSum'Policy_Head/bias/Regularizer/Square:y:0+Policy_Head/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: g
"Policy_Head/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
 Policy_Head/bias/Regularizer/mulMul+Policy_Head/bias/Regularizer/mul/x:output:0)Policy_Head/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: b
IdentityIdentityValue_Head/Tanh:y:0^NoOp*
T0*'
_output_shapes
:���������o

Identity_1IdentityPolicy_Head/Softmax:softmax:0^NoOp*
T0*(
_output_shapes
:�����������%
NoOpNoOp6^Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp8^Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp_1%^Batch_Normalization_0/ReadVariableOp'^Batch_Normalization_0/ReadVariableOp_16^Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp8^Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1%^Batch_Normalization_1/ReadVariableOp'^Batch_Normalization_1/ReadVariableOp_16^Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp8^Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1%^Batch_Normalization_2/ReadVariableOp'^Batch_Normalization_2/ReadVariableOp_16^Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp8^Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp_1%^Batch_Normalization_3/ReadVariableOp'^Batch_Normalization_3/ReadVariableOp_16^Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp8^Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp_1%^Batch_Normalization_4/ReadVariableOp'^Batch_Normalization_4/ReadVariableOp_16^Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp8^Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp_1%^Batch_Normalization_5/ReadVariableOp'^Batch_Normalization_5/ReadVariableOp_1-^Convolutional_Layer_0/BiasAdd/ReadVariableOp,^Convolutional_Layer_0/Conv2D/ReadVariableOp=^Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp-^Convolutional_Layer_1/BiasAdd/ReadVariableOp,^Convolutional_Layer_1/Conv2D/ReadVariableOp=^Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp-^Convolutional_Layer_2/BiasAdd/ReadVariableOp,^Convolutional_Layer_2/Conv2D/ReadVariableOp=^Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp-^Convolutional_Layer_3/BiasAdd/ReadVariableOp,^Convolutional_Layer_3/Conv2D/ReadVariableOp=^Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp-^Convolutional_Layer_4/BiasAdd/ReadVariableOp,^Convolutional_Layer_4/Conv2D/ReadVariableOp=^Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp-^Convolutional_Layer_5/BiasAdd/ReadVariableOp,^Convolutional_Layer_5/Conv2D/ReadVariableOp=^Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp=^Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp?^Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1,^Policy_Batch_Normalization_1/ReadVariableOp.^Policy_Batch_Normalization_1/ReadVariableOp_1=^Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp?^Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1,^Policy_Batch_Normalization_2/ReadVariableOp.^Policy_Batch_Normalization_2/ReadVariableOp_14^Policy_Convolutional_Layer_1/BiasAdd/ReadVariableOp3^Policy_Convolutional_Layer_1/Conv2D/ReadVariableOpD^Policy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpF^Policy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp4^Policy_Convolutional_Layer_2/BiasAdd/ReadVariableOp3^Policy_Convolutional_Layer_2/Conv2D/ReadVariableOpD^Policy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpF^Policy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp#^Policy_Head/BiasAdd/ReadVariableOp"^Policy_Head/MatMul/ReadVariableOp3^Policy_Head/bias/Regularizer/Square/ReadVariableOp5^Policy_Head/kernel/Regularizer/Square/ReadVariableOp<^Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp>^Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1+^Value_Batch_Normalization_1/ReadVariableOp-^Value_Batch_Normalization_1/ReadVariableOp_15^Value_Batch_Normalization_2/batchnorm/ReadVariableOp7^Value_Batch_Normalization_2/batchnorm/ReadVariableOp_17^Value_Batch_Normalization_2/batchnorm/ReadVariableOp_29^Value_Batch_Normalization_2/batchnorm/mul/ReadVariableOp1^Value_Convolutional_Layer/BiasAdd/ReadVariableOp0^Value_Convolutional_Layer/Conv2D/ReadVariableOpA^Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOpC^Value_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp)^Value_Dense_Layer/BiasAdd/ReadVariableOp(^Value_Dense_Layer/MatMul/ReadVariableOp9^Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp;^Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp"^Value_Head/BiasAdd/ReadVariableOp!^Value_Head/MatMul/ReadVariableOp2^Value_Head/bias/Regularizer/Square/ReadVariableOp4^Value_Head/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������	�: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2n
5Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp5Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp2r
7Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp_17Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp_12L
$Batch_Normalization_0/ReadVariableOp$Batch_Normalization_0/ReadVariableOp2P
&Batch_Normalization_0/ReadVariableOp_1&Batch_Normalization_0/ReadVariableOp_12n
5Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp5Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp2r
7Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_17Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_12L
$Batch_Normalization_1/ReadVariableOp$Batch_Normalization_1/ReadVariableOp2P
&Batch_Normalization_1/ReadVariableOp_1&Batch_Normalization_1/ReadVariableOp_12n
5Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp5Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp2r
7Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_17Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_12L
$Batch_Normalization_2/ReadVariableOp$Batch_Normalization_2/ReadVariableOp2P
&Batch_Normalization_2/ReadVariableOp_1&Batch_Normalization_2/ReadVariableOp_12n
5Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp5Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp2r
7Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp_17Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp_12L
$Batch_Normalization_3/ReadVariableOp$Batch_Normalization_3/ReadVariableOp2P
&Batch_Normalization_3/ReadVariableOp_1&Batch_Normalization_3/ReadVariableOp_12n
5Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp5Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp2r
7Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp_17Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp_12L
$Batch_Normalization_4/ReadVariableOp$Batch_Normalization_4/ReadVariableOp2P
&Batch_Normalization_4/ReadVariableOp_1&Batch_Normalization_4/ReadVariableOp_12n
5Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp5Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp2r
7Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp_17Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp_12L
$Batch_Normalization_5/ReadVariableOp$Batch_Normalization_5/ReadVariableOp2P
&Batch_Normalization_5/ReadVariableOp_1&Batch_Normalization_5/ReadVariableOp_12\
,Convolutional_Layer_0/BiasAdd/ReadVariableOp,Convolutional_Layer_0/BiasAdd/ReadVariableOp2Z
+Convolutional_Layer_0/Conv2D/ReadVariableOp+Convolutional_Layer_0/Conv2D/ReadVariableOp2|
<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp2\
,Convolutional_Layer_1/BiasAdd/ReadVariableOp,Convolutional_Layer_1/BiasAdd/ReadVariableOp2Z
+Convolutional_Layer_1/Conv2D/ReadVariableOp+Convolutional_Layer_1/Conv2D/ReadVariableOp2|
<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp2\
,Convolutional_Layer_2/BiasAdd/ReadVariableOp,Convolutional_Layer_2/BiasAdd/ReadVariableOp2Z
+Convolutional_Layer_2/Conv2D/ReadVariableOp+Convolutional_Layer_2/Conv2D/ReadVariableOp2|
<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp2\
,Convolutional_Layer_3/BiasAdd/ReadVariableOp,Convolutional_Layer_3/BiasAdd/ReadVariableOp2Z
+Convolutional_Layer_3/Conv2D/ReadVariableOp+Convolutional_Layer_3/Conv2D/ReadVariableOp2|
<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp2\
,Convolutional_Layer_4/BiasAdd/ReadVariableOp,Convolutional_Layer_4/BiasAdd/ReadVariableOp2Z
+Convolutional_Layer_4/Conv2D/ReadVariableOp+Convolutional_Layer_4/Conv2D/ReadVariableOp2|
<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp2\
,Convolutional_Layer_5/BiasAdd/ReadVariableOp,Convolutional_Layer_5/BiasAdd/ReadVariableOp2Z
+Convolutional_Layer_5/Conv2D/ReadVariableOp+Convolutional_Layer_5/Conv2D/ReadVariableOp2|
<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp2|
<Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp<Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp2�
>Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1>Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_12Z
+Policy_Batch_Normalization_1/ReadVariableOp+Policy_Batch_Normalization_1/ReadVariableOp2^
-Policy_Batch_Normalization_1/ReadVariableOp_1-Policy_Batch_Normalization_1/ReadVariableOp_12|
<Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp<Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp2�
>Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1>Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_12Z
+Policy_Batch_Normalization_2/ReadVariableOp+Policy_Batch_Normalization_2/ReadVariableOp2^
-Policy_Batch_Normalization_2/ReadVariableOp_1-Policy_Batch_Normalization_2/ReadVariableOp_12j
3Policy_Convolutional_Layer_1/BiasAdd/ReadVariableOp3Policy_Convolutional_Layer_1/BiasAdd/ReadVariableOp2h
2Policy_Convolutional_Layer_1/Conv2D/ReadVariableOp2Policy_Convolutional_Layer_1/Conv2D/ReadVariableOp2�
CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpCPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp2�
EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpEPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp2j
3Policy_Convolutional_Layer_2/BiasAdd/ReadVariableOp3Policy_Convolutional_Layer_2/BiasAdd/ReadVariableOp2h
2Policy_Convolutional_Layer_2/Conv2D/ReadVariableOp2Policy_Convolutional_Layer_2/Conv2D/ReadVariableOp2�
CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpCPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp2�
EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpEPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp2H
"Policy_Head/BiasAdd/ReadVariableOp"Policy_Head/BiasAdd/ReadVariableOp2F
!Policy_Head/MatMul/ReadVariableOp!Policy_Head/MatMul/ReadVariableOp2h
2Policy_Head/bias/Regularizer/Square/ReadVariableOp2Policy_Head/bias/Regularizer/Square/ReadVariableOp2l
4Policy_Head/kernel/Regularizer/Square/ReadVariableOp4Policy_Head/kernel/Regularizer/Square/ReadVariableOp2z
;Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp;Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp2~
=Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1=Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_12X
*Value_Batch_Normalization_1/ReadVariableOp*Value_Batch_Normalization_1/ReadVariableOp2\
,Value_Batch_Normalization_1/ReadVariableOp_1,Value_Batch_Normalization_1/ReadVariableOp_12l
4Value_Batch_Normalization_2/batchnorm/ReadVariableOp4Value_Batch_Normalization_2/batchnorm/ReadVariableOp2p
6Value_Batch_Normalization_2/batchnorm/ReadVariableOp_16Value_Batch_Normalization_2/batchnorm/ReadVariableOp_12p
6Value_Batch_Normalization_2/batchnorm/ReadVariableOp_26Value_Batch_Normalization_2/batchnorm/ReadVariableOp_22t
8Value_Batch_Normalization_2/batchnorm/mul/ReadVariableOp8Value_Batch_Normalization_2/batchnorm/mul/ReadVariableOp2d
0Value_Convolutional_Layer/BiasAdd/ReadVariableOp0Value_Convolutional_Layer/BiasAdd/ReadVariableOp2b
/Value_Convolutional_Layer/Conv2D/ReadVariableOp/Value_Convolutional_Layer/Conv2D/ReadVariableOp2�
@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp2�
BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOpBValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp2T
(Value_Dense_Layer/BiasAdd/ReadVariableOp(Value_Dense_Layer/BiasAdd/ReadVariableOp2R
'Value_Dense_Layer/MatMul/ReadVariableOp'Value_Dense_Layer/MatMul/ReadVariableOp2t
8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp2x
:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp2F
!Value_Head/BiasAdd/ReadVariableOp!Value_Head/BiasAdd/ReadVariableOp2D
 Value_Head/MatMul/ReadVariableOp Value_Head/MatMul/ReadVariableOp2f
1Value_Head/bias/Regularizer/Square/ReadVariableOp1Value_Head/bias/Regularizer/Square/ReadVariableOp2j
3Value_Head/kernel/Regularizer/Square/ReadVariableOp3Value_Head/kernel/Regularizer/Square/ReadVariableOp:X T
0
_output_shapes
:���������	�
 
_user_specified_nameinputs
�
�
__inference_loss_fn_8_8157a
Gconvolutional_layer_4_kernel_regularizer_square_readvariableop_resource:
identity��>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp�
>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOpReadVariableOpGconvolutional_layer_4_kernel_regularizer_square_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_4/kernel/Regularizer/SquareSquareFConvolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_4/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_4/kernel/Regularizer/SumSum3Convolutional_Layer_4/kernel/Regularizer/Square:y:07Convolutional_Layer_4/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_4/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_4/kernel/Regularizer/mulMul7Convolutional_Layer_4/kernel/Regularizer/mul/x:output:05Convolutional_Layer_4/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: n
IdentityIdentity0Convolutional_Layer_4/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp?^Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2�
>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp
�
�
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_2472

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_6816

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
��
�+
A__inference_model_1_layer_call_and_return_conditional_losses_3020

inputs5
convolutional_layer_0_2282:�(
convolutional_layer_0_2284:(
batch_normalization_0_2305:(
batch_normalization_0_2307:(
batch_normalization_0_2309:(
batch_normalization_0_2311:4
convolutional_layer_1_2338:(
convolutional_layer_1_2340:(
batch_normalization_1_2361:(
batch_normalization_1_2363:(
batch_normalization_1_2365:(
batch_normalization_1_2367:4
convolutional_layer_2_2394:(
convolutional_layer_2_2396:(
batch_normalization_2_2417:(
batch_normalization_2_2419:(
batch_normalization_2_2421:(
batch_normalization_2_2423:4
convolutional_layer_3_2450:(
convolutional_layer_3_2452:(
batch_normalization_3_2473:(
batch_normalization_3_2475:(
batch_normalization_3_2477:(
batch_normalization_3_2479:4
convolutional_layer_4_2506:(
convolutional_layer_4_2508:(
batch_normalization_4_2529:(
batch_normalization_4_2531:(
batch_normalization_4_2533:(
batch_normalization_4_2535:4
convolutional_layer_5_2562:(
convolutional_layer_5_2564:(
batch_normalization_5_2585:(
batch_normalization_5_2587:(
batch_normalization_5_2589:(
batch_normalization_5_2591:;
!policy_convolutional_layer_1_2618:/
!policy_convolutional_layer_1_2620:8
value_convolutional_layer_2647:,
value_convolutional_layer_2649:/
!policy_batch_normalization_1_2670:/
!policy_batch_normalization_1_2672:/
!policy_batch_normalization_1_2674:/
!policy_batch_normalization_1_2676:.
 value_batch_normalization_1_2697:.
 value_batch_normalization_1_2699:.
 value_batch_normalization_1_2701:.
 value_batch_normalization_1_2703:;
!policy_convolutional_layer_2_2730:/
!policy_convolutional_layer_2_2732:/
!policy_batch_normalization_2_2761:/
!policy_batch_normalization_2_2763:/
!policy_batch_normalization_2_2765:/
!policy_batch_normalization_2_2767:(
value_dense_layer_2794:?@$
value_dense_layer_2796:@.
 value_batch_normalization_2_2807:@.
 value_batch_normalization_2_2809:@.
 value_batch_normalization_2_2811:@.
 value_batch_normalization_2_2813:@#
policy_head_2840:	?�
policy_head_2842:	�!
value_head_2869:@
value_head_2871:
identity

identity_1��-Batch_Normalization_0/StatefulPartitionedCall�-Batch_Normalization_1/StatefulPartitionedCall�-Batch_Normalization_2/StatefulPartitionedCall�-Batch_Normalization_3/StatefulPartitionedCall�-Batch_Normalization_4/StatefulPartitionedCall�-Batch_Normalization_5/StatefulPartitionedCall�-Convolutional_Layer_0/StatefulPartitionedCall�<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp�-Convolutional_Layer_1/StatefulPartitionedCall�<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp�-Convolutional_Layer_2/StatefulPartitionedCall�<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp�-Convolutional_Layer_3/StatefulPartitionedCall�<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp�-Convolutional_Layer_4/StatefulPartitionedCall�<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp�-Convolutional_Layer_5/StatefulPartitionedCall�<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp�4Policy_Batch_Normalization_1/StatefulPartitionedCall�4Policy_Batch_Normalization_2/StatefulPartitionedCall�4Policy_Convolutional_Layer_1/StatefulPartitionedCall�CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp�EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp�4Policy_Convolutional_Layer_2/StatefulPartitionedCall�CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp�EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp�#Policy_Head/StatefulPartitionedCall�2Policy_Head/bias/Regularizer/Square/ReadVariableOp�4Policy_Head/kernel/Regularizer/Square/ReadVariableOp�3Value_Batch_Normalization_1/StatefulPartitionedCall�3Value_Batch_Normalization_2/StatefulPartitionedCall�1Value_Convolutional_Layer/StatefulPartitionedCall�@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp�BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp�)Value_Dense_Layer/StatefulPartitionedCall�8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp�:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp�"Value_Head/StatefulPartitionedCall�1Value_Head/bias/Regularizer/Square/ReadVariableOp�3Value_Head/kernel/Regularizer/Square/ReadVariableOp�
-Convolutional_Layer_0/StatefulPartitionedCallStatefulPartitionedCallinputsconvolutional_layer_0_2282convolutional_layer_0_2284*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_0_layer_call_and_return_conditional_losses_2281�
-Batch_Normalization_0/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_0/StatefulPartitionedCall:output:0batch_normalization_0_2305batch_normalization_0_2307batch_normalization_0_2309batch_normalization_0_2311*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_2304�
-Convolutional_Layer_1/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_0/StatefulPartitionedCall:output:0convolutional_layer_1_2338convolutional_layer_1_2340*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_1_layer_call_and_return_conditional_losses_2337�
-Batch_Normalization_1/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_1/StatefulPartitionedCall:output:0batch_normalization_1_2361batch_normalization_1_2363batch_normalization_1_2365batch_normalization_1_2367*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_2360�
-Convolutional_Layer_2/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_1/StatefulPartitionedCall:output:0convolutional_layer_2_2394convolutional_layer_2_2396*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_2_layer_call_and_return_conditional_losses_2393�
-Batch_Normalization_2/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_2/StatefulPartitionedCall:output:0batch_normalization_2_2417batch_normalization_2_2419batch_normalization_2_2421batch_normalization_2_2423*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_2416�
-Convolutional_Layer_3/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_2/StatefulPartitionedCall:output:0convolutional_layer_3_2450convolutional_layer_3_2452*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_3_layer_call_and_return_conditional_losses_2449�
-Batch_Normalization_3/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_3/StatefulPartitionedCall:output:0batch_normalization_3_2473batch_normalization_3_2475batch_normalization_3_2477batch_normalization_3_2479*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_2472�
-Convolutional_Layer_4/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_3/StatefulPartitionedCall:output:0convolutional_layer_4_2506convolutional_layer_4_2508*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_4_layer_call_and_return_conditional_losses_2505�
-Batch_Normalization_4/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_4/StatefulPartitionedCall:output:0batch_normalization_4_2529batch_normalization_4_2531batch_normalization_4_2533batch_normalization_4_2535*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_2528�
-Convolutional_Layer_5/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_4/StatefulPartitionedCall:output:0convolutional_layer_5_2562convolutional_layer_5_2564*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_5_layer_call_and_return_conditional_losses_2561�
-Batch_Normalization_5/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_5/StatefulPartitionedCall:output:0batch_normalization_5_2585batch_normalization_5_2587batch_normalization_5_2589batch_normalization_5_2591*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_2584�
4Policy_Convolutional_Layer_1/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_5/StatefulPartitionedCall:output:0!policy_convolutional_layer_1_2618!policy_convolutional_layer_1_2620*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Convolutional_Layer_1_layer_call_and_return_conditional_losses_2617�
1Value_Convolutional_Layer/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_5/StatefulPartitionedCall:output:0value_convolutional_layer_2647value_convolutional_layer_2649*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *\
fWRU
S__inference_Value_Convolutional_Layer_layer_call_and_return_conditional_losses_2646�
4Policy_Batch_Normalization_1/StatefulPartitionedCallStatefulPartitionedCall=Policy_Convolutional_Layer_1/StatefulPartitionedCall:output:0!policy_batch_normalization_1_2670!policy_batch_normalization_1_2672!policy_batch_normalization_1_2674!policy_batch_normalization_1_2676*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_2669�
3Value_Batch_Normalization_1/StatefulPartitionedCallStatefulPartitionedCall:Value_Convolutional_Layer/StatefulPartitionedCall:output:0 value_batch_normalization_1_2697 value_batch_normalization_1_2699 value_batch_normalization_1_2701 value_batch_normalization_1_2703*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *^
fYRW
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_2696�
4Policy_Convolutional_Layer_2/StatefulPartitionedCallStatefulPartitionedCall=Policy_Batch_Normalization_1/StatefulPartitionedCall:output:0!policy_convolutional_layer_2_2730!policy_convolutional_layer_2_2732*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Convolutional_Layer_2_layer_call_and_return_conditional_losses_2729�
#Value_Flatten_Layer/PartitionedCallPartitionedCall<Value_Batch_Normalization_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_Value_Flatten_Layer_layer_call_and_return_conditional_losses_2741�
4Policy_Batch_Normalization_2/StatefulPartitionedCallStatefulPartitionedCall=Policy_Convolutional_Layer_2/StatefulPartitionedCall:output:0!policy_batch_normalization_2_2761!policy_batch_normalization_2_2763!policy_batch_normalization_2_2765!policy_batch_normalization_2_2767*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_2760�
)Value_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall,Value_Flatten_Layer/PartitionedCall:output:0value_dense_layer_2794value_dense_layer_2796*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_Value_Dense_Layer_layer_call_and_return_conditional_losses_2793�
$Policy_Flatten_Layer/PartitionedCallPartitionedCall=Policy_Batch_Normalization_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *W
fRRP
N__inference_Policy_Flatten_Layer_layer_call_and_return_conditional_losses_2805�
3Value_Batch_Normalization_2/StatefulPartitionedCallStatefulPartitionedCall2Value_Dense_Layer/StatefulPartitionedCall:output:0 value_batch_normalization_2_2807 value_batch_normalization_2_2809 value_batch_normalization_2_2811 value_batch_normalization_2_2813*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *^
fYRW
U__inference_Value_Batch_Normalization_2_layer_call_and_return_conditional_losses_2193�
#Policy_Head/StatefulPartitionedCallStatefulPartitionedCall-Policy_Flatten_Layer/PartitionedCall:output:0policy_head_2840policy_head_2842*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *N
fIRG
E__inference_Policy_Head_layer_call_and_return_conditional_losses_2839�
"Value_Head/StatefulPartitionedCallStatefulPartitionedCall<Value_Batch_Normalization_2/StatefulPartitionedCall:output:0value_head_2869value_head_2871*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_Value_Head_layer_call_and_return_conditional_losses_2868�
>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_0_2282*'
_output_shapes
:�*
dtype0�
/Convolutional_Layer_0/kernel/Regularizer/SquareSquareFConvolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*'
_output_shapes
:��
.Convolutional_Layer_0/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_0/kernel/Regularizer/SumSum3Convolutional_Layer_0/kernel/Regularizer/Square:y:07Convolutional_Layer_0/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_0/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_0/kernel/Regularizer/mulMul7Convolutional_Layer_0/kernel/Regularizer/mul/x:output:05Convolutional_Layer_0/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_0_2284*
_output_shapes
:*
dtype0�
-Convolutional_Layer_0/bias/Regularizer/SquareSquareDConvolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_0/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_0/bias/Regularizer/SumSum1Convolutional_Layer_0/bias/Regularizer/Square:y:05Convolutional_Layer_0/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_0/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_0/bias/Regularizer/mulMul5Convolutional_Layer_0/bias/Regularizer/mul/x:output:03Convolutional_Layer_0/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_1_2338*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_1/kernel/Regularizer/SquareSquareFConvolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_1/kernel/Regularizer/SumSum3Convolutional_Layer_1/kernel/Regularizer/Square:y:07Convolutional_Layer_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_1/kernel/Regularizer/mulMul7Convolutional_Layer_1/kernel/Regularizer/mul/x:output:05Convolutional_Layer_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_1_2340*
_output_shapes
:*
dtype0�
-Convolutional_Layer_1/bias/Regularizer/SquareSquareDConvolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_1/bias/Regularizer/SumSum1Convolutional_Layer_1/bias/Regularizer/Square:y:05Convolutional_Layer_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_1/bias/Regularizer/mulMul5Convolutional_Layer_1/bias/Regularizer/mul/x:output:03Convolutional_Layer_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_2_2394*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_2/kernel/Regularizer/SquareSquareFConvolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_2/kernel/Regularizer/SumSum3Convolutional_Layer_2/kernel/Regularizer/Square:y:07Convolutional_Layer_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_2/kernel/Regularizer/mulMul7Convolutional_Layer_2/kernel/Regularizer/mul/x:output:05Convolutional_Layer_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_2_2396*
_output_shapes
:*
dtype0�
-Convolutional_Layer_2/bias/Regularizer/SquareSquareDConvolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_2/bias/Regularizer/SumSum1Convolutional_Layer_2/bias/Regularizer/Square:y:05Convolutional_Layer_2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_2/bias/Regularizer/mulMul5Convolutional_Layer_2/bias/Regularizer/mul/x:output:03Convolutional_Layer_2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_3_2450*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_3/kernel/Regularizer/SquareSquareFConvolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_3/kernel/Regularizer/SumSum3Convolutional_Layer_3/kernel/Regularizer/Square:y:07Convolutional_Layer_3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_3/kernel/Regularizer/mulMul7Convolutional_Layer_3/kernel/Regularizer/mul/x:output:05Convolutional_Layer_3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_3_2452*
_output_shapes
:*
dtype0�
-Convolutional_Layer_3/bias/Regularizer/SquareSquareDConvolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_3/bias/Regularizer/SumSum1Convolutional_Layer_3/bias/Regularizer/Square:y:05Convolutional_Layer_3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_3/bias/Regularizer/mulMul5Convolutional_Layer_3/bias/Regularizer/mul/x:output:03Convolutional_Layer_3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_4_2506*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_4/kernel/Regularizer/SquareSquareFConvolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_4/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_4/kernel/Regularizer/SumSum3Convolutional_Layer_4/kernel/Regularizer/Square:y:07Convolutional_Layer_4/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_4/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_4/kernel/Regularizer/mulMul7Convolutional_Layer_4/kernel/Regularizer/mul/x:output:05Convolutional_Layer_4/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_4_2508*
_output_shapes
:*
dtype0�
-Convolutional_Layer_4/bias/Regularizer/SquareSquareDConvolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_4/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_4/bias/Regularizer/SumSum1Convolutional_Layer_4/bias/Regularizer/Square:y:05Convolutional_Layer_4/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_4/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_4/bias/Regularizer/mulMul5Convolutional_Layer_4/bias/Regularizer/mul/x:output:03Convolutional_Layer_4/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_5_2562*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_5/kernel/Regularizer/SquareSquareFConvolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_5/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_5/kernel/Regularizer/SumSum3Convolutional_Layer_5/kernel/Regularizer/Square:y:07Convolutional_Layer_5/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_5/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_5/kernel/Regularizer/mulMul7Convolutional_Layer_5/kernel/Regularizer/mul/x:output:05Convolutional_Layer_5/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_5_2564*
_output_shapes
:*
dtype0�
-Convolutional_Layer_5/bias/Regularizer/SquareSquareDConvolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_5/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_5/bias/Regularizer/SumSum1Convolutional_Layer_5/bias/Regularizer/Square:y:05Convolutional_Layer_5/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_5/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_5/bias/Regularizer/mulMul5Convolutional_Layer_5/bias/Regularizer/mul/x:output:03Convolutional_Layer_5/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOpReadVariableOpvalue_convolutional_layer_2647*&
_output_shapes
:*
dtype0�
3Value_Convolutional_Layer/kernel/Regularizer/SquareSquareJValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
2Value_Convolutional_Layer/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
0Value_Convolutional_Layer/kernel/Regularizer/SumSum7Value_Convolutional_Layer/kernel/Regularizer/Square:y:0;Value_Convolutional_Layer/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: w
2Value_Convolutional_Layer/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
0Value_Convolutional_Layer/kernel/Regularizer/mulMul;Value_Convolutional_Layer/kernel/Regularizer/mul/x:output:09Value_Convolutional_Layer/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOpReadVariableOpvalue_convolutional_layer_2649*
_output_shapes
:*
dtype0�
1Value_Convolutional_Layer/bias/Regularizer/SquareSquareHValue_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:z
0Value_Convolutional_Layer/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
.Value_Convolutional_Layer/bias/Regularizer/SumSum5Value_Convolutional_Layer/bias/Regularizer/Square:y:09Value_Convolutional_Layer/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: u
0Value_Convolutional_Layer/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
.Value_Convolutional_Layer/bias/Regularizer/mulMul9Value_Convolutional_Layer/bias/Regularizer/mul/x:output:07Value_Convolutional_Layer/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp!policy_convolutional_layer_1_2618*&
_output_shapes
:*
dtype0�
6Policy_Convolutional_Layer_1/kernel/Regularizer/SquareSquareMPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
5Policy_Convolutional_Layer_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3Policy_Convolutional_Layer_1/kernel/Regularizer/SumSum:Policy_Convolutional_Layer_1/kernel/Regularizer/Square:y:0>Policy_Convolutional_Layer_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5Policy_Convolutional_Layer_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
3Policy_Convolutional_Layer_1/kernel/Regularizer/mulMul>Policy_Convolutional_Layer_1/kernel/Regularizer/mul/x:output:0<Policy_Convolutional_Layer_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpReadVariableOp!policy_convolutional_layer_1_2620*
_output_shapes
:*
dtype0�
4Policy_Convolutional_Layer_1/bias/Regularizer/SquareSquareKPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:}
3Policy_Convolutional_Layer_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
1Policy_Convolutional_Layer_1/bias/Regularizer/SumSum8Policy_Convolutional_Layer_1/bias/Regularizer/Square:y:0<Policy_Convolutional_Layer_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: x
3Policy_Convolutional_Layer_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
1Policy_Convolutional_Layer_1/bias/Regularizer/mulMul<Policy_Convolutional_Layer_1/bias/Regularizer/mul/x:output:0:Policy_Convolutional_Layer_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp!policy_convolutional_layer_2_2730*&
_output_shapes
:*
dtype0�
6Policy_Convolutional_Layer_2/kernel/Regularizer/SquareSquareMPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
5Policy_Convolutional_Layer_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3Policy_Convolutional_Layer_2/kernel/Regularizer/SumSum:Policy_Convolutional_Layer_2/kernel/Regularizer/Square:y:0>Policy_Convolutional_Layer_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5Policy_Convolutional_Layer_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
3Policy_Convolutional_Layer_2/kernel/Regularizer/mulMul>Policy_Convolutional_Layer_2/kernel/Regularizer/mul/x:output:0<Policy_Convolutional_Layer_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpReadVariableOp!policy_convolutional_layer_2_2732*
_output_shapes
:*
dtype0�
4Policy_Convolutional_Layer_2/bias/Regularizer/SquareSquareKPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:}
3Policy_Convolutional_Layer_2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
1Policy_Convolutional_Layer_2/bias/Regularizer/SumSum8Policy_Convolutional_Layer_2/bias/Regularizer/Square:y:0<Policy_Convolutional_Layer_2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: x
3Policy_Convolutional_Layer_2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
1Policy_Convolutional_Layer_2/bias/Regularizer/mulMul<Policy_Convolutional_Layer_2/bias/Regularizer/mul/x:output:0:Policy_Convolutional_Layer_2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOpReadVariableOpvalue_dense_layer_2794*
_output_shapes

:?@*
dtype0�
+Value_Dense_Layer/kernel/Regularizer/SquareSquareBValue_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:?@{
*Value_Dense_Layer/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
(Value_Dense_Layer/kernel/Regularizer/SumSum/Value_Dense_Layer/kernel/Regularizer/Square:y:03Value_Dense_Layer/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: o
*Value_Dense_Layer/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
(Value_Dense_Layer/kernel/Regularizer/mulMul3Value_Dense_Layer/kernel/Regularizer/mul/x:output:01Value_Dense_Layer/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOpReadVariableOpvalue_dense_layer_2796*
_output_shapes
:@*
dtype0�
)Value_Dense_Layer/bias/Regularizer/SquareSquare@Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:@r
(Value_Dense_Layer/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
&Value_Dense_Layer/bias/Regularizer/SumSum-Value_Dense_Layer/bias/Regularizer/Square:y:01Value_Dense_Layer/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: m
(Value_Dense_Layer/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
&Value_Dense_Layer/bias/Regularizer/mulMul1Value_Dense_Layer/bias/Regularizer/mul/x:output:0/Value_Dense_Layer/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
3Value_Head/kernel/Regularizer/Square/ReadVariableOpReadVariableOpvalue_head_2869*
_output_shapes

:@*
dtype0�
$Value_Head/kernel/Regularizer/SquareSquare;Value_Head/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@t
#Value_Head/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
!Value_Head/kernel/Regularizer/SumSum(Value_Head/kernel/Regularizer/Square:y:0,Value_Head/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: h
#Value_Head/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
!Value_Head/kernel/Regularizer/mulMul,Value_Head/kernel/Regularizer/mul/x:output:0*Value_Head/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: }
1Value_Head/bias/Regularizer/Square/ReadVariableOpReadVariableOpvalue_head_2871*
_output_shapes
:*
dtype0�
"Value_Head/bias/Regularizer/SquareSquare9Value_Head/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:k
!Value_Head/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
Value_Head/bias/Regularizer/SumSum&Value_Head/bias/Regularizer/Square:y:0*Value_Head/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: f
!Value_Head/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
Value_Head/bias/Regularizer/mulMul*Value_Head/bias/Regularizer/mul/x:output:0(Value_Head/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
4Policy_Head/kernel/Regularizer/Square/ReadVariableOpReadVariableOppolicy_head_2840*
_output_shapes
:	?�*
dtype0�
%Policy_Head/kernel/Regularizer/SquareSquare<Policy_Head/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?�u
$Policy_Head/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
"Policy_Head/kernel/Regularizer/SumSum)Policy_Head/kernel/Regularizer/Square:y:0-Policy_Head/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$Policy_Head/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
"Policy_Head/kernel/Regularizer/mulMul-Policy_Head/kernel/Regularizer/mul/x:output:0+Policy_Head/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
2Policy_Head/bias/Regularizer/Square/ReadVariableOpReadVariableOppolicy_head_2842*
_output_shapes	
:�*
dtype0�
#Policy_Head/bias/Regularizer/SquareSquare:Policy_Head/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes	
:�l
"Policy_Head/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
 Policy_Head/bias/Regularizer/SumSum'Policy_Head/bias/Regularizer/Square:y:0+Policy_Head/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: g
"Policy_Head/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
 Policy_Head/bias/Regularizer/mulMul+Policy_Head/bias/Regularizer/mul/x:output:0)Policy_Head/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: z
IdentityIdentity+Value_Head/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������~

Identity_1Identity,Policy_Head/StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:�����������
NoOpNoOp.^Batch_Normalization_0/StatefulPartitionedCall.^Batch_Normalization_1/StatefulPartitionedCall.^Batch_Normalization_2/StatefulPartitionedCall.^Batch_Normalization_3/StatefulPartitionedCall.^Batch_Normalization_4/StatefulPartitionedCall.^Batch_Normalization_5/StatefulPartitionedCall.^Convolutional_Layer_0/StatefulPartitionedCall=^Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp.^Convolutional_Layer_1/StatefulPartitionedCall=^Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp.^Convolutional_Layer_2/StatefulPartitionedCall=^Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp.^Convolutional_Layer_3/StatefulPartitionedCall=^Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp.^Convolutional_Layer_4/StatefulPartitionedCall=^Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp.^Convolutional_Layer_5/StatefulPartitionedCall=^Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp5^Policy_Batch_Normalization_1/StatefulPartitionedCall5^Policy_Batch_Normalization_2/StatefulPartitionedCall5^Policy_Convolutional_Layer_1/StatefulPartitionedCallD^Policy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpF^Policy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp5^Policy_Convolutional_Layer_2/StatefulPartitionedCallD^Policy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpF^Policy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp$^Policy_Head/StatefulPartitionedCall3^Policy_Head/bias/Regularizer/Square/ReadVariableOp5^Policy_Head/kernel/Regularizer/Square/ReadVariableOp4^Value_Batch_Normalization_1/StatefulPartitionedCall4^Value_Batch_Normalization_2/StatefulPartitionedCall2^Value_Convolutional_Layer/StatefulPartitionedCallA^Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOpC^Value_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp*^Value_Dense_Layer/StatefulPartitionedCall9^Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp;^Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp#^Value_Head/StatefulPartitionedCall2^Value_Head/bias/Regularizer/Square/ReadVariableOp4^Value_Head/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������	�: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2^
-Batch_Normalization_0/StatefulPartitionedCall-Batch_Normalization_0/StatefulPartitionedCall2^
-Batch_Normalization_1/StatefulPartitionedCall-Batch_Normalization_1/StatefulPartitionedCall2^
-Batch_Normalization_2/StatefulPartitionedCall-Batch_Normalization_2/StatefulPartitionedCall2^
-Batch_Normalization_3/StatefulPartitionedCall-Batch_Normalization_3/StatefulPartitionedCall2^
-Batch_Normalization_4/StatefulPartitionedCall-Batch_Normalization_4/StatefulPartitionedCall2^
-Batch_Normalization_5/StatefulPartitionedCall-Batch_Normalization_5/StatefulPartitionedCall2^
-Convolutional_Layer_0/StatefulPartitionedCall-Convolutional_Layer_0/StatefulPartitionedCall2|
<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp2^
-Convolutional_Layer_1/StatefulPartitionedCall-Convolutional_Layer_1/StatefulPartitionedCall2|
<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp2^
-Convolutional_Layer_2/StatefulPartitionedCall-Convolutional_Layer_2/StatefulPartitionedCall2|
<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp2^
-Convolutional_Layer_3/StatefulPartitionedCall-Convolutional_Layer_3/StatefulPartitionedCall2|
<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp2^
-Convolutional_Layer_4/StatefulPartitionedCall-Convolutional_Layer_4/StatefulPartitionedCall2|
<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp2^
-Convolutional_Layer_5/StatefulPartitionedCall-Convolutional_Layer_5/StatefulPartitionedCall2|
<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp2l
4Policy_Batch_Normalization_1/StatefulPartitionedCall4Policy_Batch_Normalization_1/StatefulPartitionedCall2l
4Policy_Batch_Normalization_2/StatefulPartitionedCall4Policy_Batch_Normalization_2/StatefulPartitionedCall2l
4Policy_Convolutional_Layer_1/StatefulPartitionedCall4Policy_Convolutional_Layer_1/StatefulPartitionedCall2�
CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpCPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp2�
EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpEPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp2l
4Policy_Convolutional_Layer_2/StatefulPartitionedCall4Policy_Convolutional_Layer_2/StatefulPartitionedCall2�
CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpCPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp2�
EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpEPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp2J
#Policy_Head/StatefulPartitionedCall#Policy_Head/StatefulPartitionedCall2h
2Policy_Head/bias/Regularizer/Square/ReadVariableOp2Policy_Head/bias/Regularizer/Square/ReadVariableOp2l
4Policy_Head/kernel/Regularizer/Square/ReadVariableOp4Policy_Head/kernel/Regularizer/Square/ReadVariableOp2j
3Value_Batch_Normalization_1/StatefulPartitionedCall3Value_Batch_Normalization_1/StatefulPartitionedCall2j
3Value_Batch_Normalization_2/StatefulPartitionedCall3Value_Batch_Normalization_2/StatefulPartitionedCall2f
1Value_Convolutional_Layer/StatefulPartitionedCall1Value_Convolutional_Layer/StatefulPartitionedCall2�
@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp2�
BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOpBValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp2V
)Value_Dense_Layer/StatefulPartitionedCall)Value_Dense_Layer/StatefulPartitionedCall2t
8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp2x
:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp2H
"Value_Head/StatefulPartitionedCall"Value_Head/StatefulPartitionedCall2f
1Value_Head/bias/Regularizer/Square/ReadVariableOp1Value_Head/bias/Regularizer/Square/ReadVariableOp2j
3Value_Head/kernel/Regularizer/Square/ReadVariableOp3Value_Head/kernel/Regularizer/Square/ReadVariableOp:X T
0
_output_shapes
:���������	�
 
_user_specified_nameinputs
�
�
V__inference_Policy_Convolutional_Layer_2_layer_call_and_return_conditional_losses_2729

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp�EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������	�
EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
6Policy_Convolutional_Layer_2/kernel/Regularizer/SquareSquareMPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
5Policy_Convolutional_Layer_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3Policy_Convolutional_Layer_2/kernel/Regularizer/SumSum:Policy_Convolutional_Layer_2/kernel/Regularizer/Square:y:0>Policy_Convolutional_Layer_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5Policy_Convolutional_Layer_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
3Policy_Convolutional_Layer_2/kernel/Regularizer/mulMul>Policy_Convolutional_Layer_2/kernel/Regularizer/mul/x:output:0<Policy_Convolutional_Layer_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
4Policy_Convolutional_Layer_2/bias/Regularizer/SquareSquareKPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:}
3Policy_Convolutional_Layer_2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
1Policy_Convolutional_Layer_2/bias/Regularizer/SumSum8Policy_Convolutional_Layer_2/bias/Regularizer/Square:y:0<Policy_Convolutional_Layer_2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: x
3Policy_Convolutional_Layer_2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
1Policy_Convolutional_Layer_2/bias/Regularizer/mulMul<Policy_Convolutional_Layer_2/bias/Regularizer/mul/x:output:0:Policy_Convolutional_Layer_2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOpD^Policy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpF^Policy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2�
CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpCPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp2�
EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpEPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_1807

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
&__inference_model_1_layer_call_fn_5540

inputs"
unknown:�
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:#
	unknown_5:
	unknown_6:
	unknown_7:
	unknown_8:
	unknown_9:

unknown_10:$

unknown_11:

unknown_12:

unknown_13:

unknown_14:

unknown_15:

unknown_16:$

unknown_17:

unknown_18:

unknown_19:

unknown_20:

unknown_21:

unknown_22:$

unknown_23:

unknown_24:

unknown_25:

unknown_26:

unknown_27:

unknown_28:$

unknown_29:

unknown_30:

unknown_31:

unknown_32:

unknown_33:

unknown_34:$

unknown_35:

unknown_36:$

unknown_37:

unknown_38:

unknown_39:

unknown_40:

unknown_41:

unknown_42:

unknown_43:

unknown_44:

unknown_45:

unknown_46:$

unknown_47:

unknown_48:

unknown_49:

unknown_50:

unknown_51:

unknown_52:

unknown_53:?@

unknown_54:@

unknown_55:@

unknown_56:@

unknown_57:@

unknown_58:@

unknown_59:	?�

unknown_60:	�

unknown_61:@

unknown_62:
identity

identity_1��StatefulPartitionedCall�	
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32
unknown_33
unknown_34
unknown_35
unknown_36
unknown_37
unknown_38
unknown_39
unknown_40
unknown_41
unknown_42
unknown_43
unknown_44
unknown_45
unknown_46
unknown_47
unknown_48
unknown_49
unknown_50
unknown_51
unknown_52
unknown_53
unknown_54
unknown_55
unknown_56
unknown_57
unknown_58
unknown_59
unknown_60
unknown_61
unknown_62*L
TinE
C2A*
Tout
2*
_collective_manager_ids
 *;
_output_shapes)
':���������:����������*N
_read_only_resource_inputs0
.,	
 !"%&'()*-.123478;<=>?@*-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_model_1_layer_call_and_return_conditional_losses_4119o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������r

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*(
_output_shapes
:����������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������	�: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:���������	�
 
_user_specified_nameinputs
��
�0
 __inference__traced_restore_8776
file_prefixH
-assignvariableop_convolutional_layer_0_kernel:�;
-assignvariableop_1_convolutional_layer_0_bias:<
.assignvariableop_2_batch_normalization_0_gamma:;
-assignvariableop_3_batch_normalization_0_beta:B
4assignvariableop_4_batch_normalization_0_moving_mean:F
8assignvariableop_5_batch_normalization_0_moving_variance:I
/assignvariableop_6_convolutional_layer_1_kernel:;
-assignvariableop_7_convolutional_layer_1_bias:<
.assignvariableop_8_batch_normalization_1_gamma:;
-assignvariableop_9_batch_normalization_1_beta:C
5assignvariableop_10_batch_normalization_1_moving_mean:G
9assignvariableop_11_batch_normalization_1_moving_variance:J
0assignvariableop_12_convolutional_layer_2_kernel:<
.assignvariableop_13_convolutional_layer_2_bias:=
/assignvariableop_14_batch_normalization_2_gamma:<
.assignvariableop_15_batch_normalization_2_beta:C
5assignvariableop_16_batch_normalization_2_moving_mean:G
9assignvariableop_17_batch_normalization_2_moving_variance:J
0assignvariableop_18_convolutional_layer_3_kernel:<
.assignvariableop_19_convolutional_layer_3_bias:=
/assignvariableop_20_batch_normalization_3_gamma:<
.assignvariableop_21_batch_normalization_3_beta:C
5assignvariableop_22_batch_normalization_3_moving_mean:G
9assignvariableop_23_batch_normalization_3_moving_variance:J
0assignvariableop_24_convolutional_layer_4_kernel:<
.assignvariableop_25_convolutional_layer_4_bias:=
/assignvariableop_26_batch_normalization_4_gamma:<
.assignvariableop_27_batch_normalization_4_beta:C
5assignvariableop_28_batch_normalization_4_moving_mean:G
9assignvariableop_29_batch_normalization_4_moving_variance:J
0assignvariableop_30_convolutional_layer_5_kernel:<
.assignvariableop_31_convolutional_layer_5_bias:=
/assignvariableop_32_batch_normalization_5_gamma:<
.assignvariableop_33_batch_normalization_5_beta:C
5assignvariableop_34_batch_normalization_5_moving_mean:G
9assignvariableop_35_batch_normalization_5_moving_variance:N
4assignvariableop_36_value_convolutional_layer_kernel:@
2assignvariableop_37_value_convolutional_layer_bias:Q
7assignvariableop_38_policy_convolutional_layer_1_kernel:C
5assignvariableop_39_policy_convolutional_layer_1_bias:C
5assignvariableop_40_value_batch_normalization_1_gamma:B
4assignvariableop_41_value_batch_normalization_1_beta:I
;assignvariableop_42_value_batch_normalization_1_moving_mean:M
?assignvariableop_43_value_batch_normalization_1_moving_variance:D
6assignvariableop_44_policy_batch_normalization_1_gamma:C
5assignvariableop_45_policy_batch_normalization_1_beta:J
<assignvariableop_46_policy_batch_normalization_1_moving_mean:N
@assignvariableop_47_policy_batch_normalization_1_moving_variance:Q
7assignvariableop_48_policy_convolutional_layer_2_kernel:C
5assignvariableop_49_policy_convolutional_layer_2_bias:>
,assignvariableop_50_value_dense_layer_kernel:?@8
*assignvariableop_51_value_dense_layer_bias:@D
6assignvariableop_52_policy_batch_normalization_2_gamma:C
5assignvariableop_53_policy_batch_normalization_2_beta:J
<assignvariableop_54_policy_batch_normalization_2_moving_mean:N
@assignvariableop_55_policy_batch_normalization_2_moving_variance:C
5assignvariableop_56_value_batch_normalization_2_gamma:@B
4assignvariableop_57_value_batch_normalization_2_beta:@I
;assignvariableop_58_value_batch_normalization_2_moving_mean:@M
?assignvariableop_59_value_batch_normalization_2_moving_variance:@7
%assignvariableop_60_value_head_kernel:@1
#assignvariableop_61_value_head_bias:9
&assignvariableop_62_policy_head_kernel:	?�3
$assignvariableop_63_policy_head_bias:	�#
assignvariableop_64_total: #
assignvariableop_65_count: %
assignvariableop_66_total_1: %
assignvariableop_67_count_1: %
assignvariableop_68_total_2: %
assignvariableop_69_count_2: 
identity_71��AssignVariableOp�AssignVariableOp_1�AssignVariableOp_10�AssignVariableOp_11�AssignVariableOp_12�AssignVariableOp_13�AssignVariableOp_14�AssignVariableOp_15�AssignVariableOp_16�AssignVariableOp_17�AssignVariableOp_18�AssignVariableOp_19�AssignVariableOp_2�AssignVariableOp_20�AssignVariableOp_21�AssignVariableOp_22�AssignVariableOp_23�AssignVariableOp_24�AssignVariableOp_25�AssignVariableOp_26�AssignVariableOp_27�AssignVariableOp_28�AssignVariableOp_29�AssignVariableOp_3�AssignVariableOp_30�AssignVariableOp_31�AssignVariableOp_32�AssignVariableOp_33�AssignVariableOp_34�AssignVariableOp_35�AssignVariableOp_36�AssignVariableOp_37�AssignVariableOp_38�AssignVariableOp_39�AssignVariableOp_4�AssignVariableOp_40�AssignVariableOp_41�AssignVariableOp_42�AssignVariableOp_43�AssignVariableOp_44�AssignVariableOp_45�AssignVariableOp_46�AssignVariableOp_47�AssignVariableOp_48�AssignVariableOp_49�AssignVariableOp_5�AssignVariableOp_50�AssignVariableOp_51�AssignVariableOp_52�AssignVariableOp_53�AssignVariableOp_54�AssignVariableOp_55�AssignVariableOp_56�AssignVariableOp_57�AssignVariableOp_58�AssignVariableOp_59�AssignVariableOp_6�AssignVariableOp_60�AssignVariableOp_61�AssignVariableOp_62�AssignVariableOp_63�AssignVariableOp_64�AssignVariableOp_65�AssignVariableOp_66�AssignVariableOp_67�AssignVariableOp_68�AssignVariableOp_69�AssignVariableOp_7�AssignVariableOp_8�AssignVariableOp_9� 
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:G*
dtype0*�
value�B�GB6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-1/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-1/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-1/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-3/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-5/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-7/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-7/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-7/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-7/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-8/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-8/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-9/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-9/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-9/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-9/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-10/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-10/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-11/gamma/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-11/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-11/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-11/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-12/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-12/bias/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-13/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-13/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-14/gamma/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-14/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-14/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-14/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-15/gamma/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-15/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-15/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-15/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-16/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-16/bias/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-17/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-17/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-18/gamma/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-18/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-18/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-18/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-19/gamma/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-19/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-19/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-19/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-20/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-20/bias/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-21/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-21/bias/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/2/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/2/count/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:G*
dtype0*�
value�B�GB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B �
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*�
_output_shapes�
�:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*U
dtypesK
I2G[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOpAssignVariableOp-assignvariableop_convolutional_layer_0_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_1AssignVariableOp-assignvariableop_1_convolutional_layer_0_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_2AssignVariableOp.assignvariableop_2_batch_normalization_0_gammaIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_3AssignVariableOp-assignvariableop_3_batch_normalization_0_betaIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_4AssignVariableOp4assignvariableop_4_batch_normalization_0_moving_meanIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_5AssignVariableOp8assignvariableop_5_batch_normalization_0_moving_varianceIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_6AssignVariableOp/assignvariableop_6_convolutional_layer_1_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_7AssignVariableOp-assignvariableop_7_convolutional_layer_1_biasIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_8AssignVariableOp.assignvariableop_8_batch_normalization_1_gammaIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_9AssignVariableOp-assignvariableop_9_batch_normalization_1_betaIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_10AssignVariableOp5assignvariableop_10_batch_normalization_1_moving_meanIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_11AssignVariableOp9assignvariableop_11_batch_normalization_1_moving_varianceIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_12AssignVariableOp0assignvariableop_12_convolutional_layer_2_kernelIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_13AssignVariableOp.assignvariableop_13_convolutional_layer_2_biasIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_14AssignVariableOp/assignvariableop_14_batch_normalization_2_gammaIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_15AssignVariableOp.assignvariableop_15_batch_normalization_2_betaIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_16AssignVariableOp5assignvariableop_16_batch_normalization_2_moving_meanIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_17AssignVariableOp9assignvariableop_17_batch_normalization_2_moving_varianceIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_18AssignVariableOp0assignvariableop_18_convolutional_layer_3_kernelIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_19AssignVariableOp.assignvariableop_19_convolutional_layer_3_biasIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_20AssignVariableOp/assignvariableop_20_batch_normalization_3_gammaIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_21AssignVariableOp.assignvariableop_21_batch_normalization_3_betaIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_22AssignVariableOp5assignvariableop_22_batch_normalization_3_moving_meanIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_23AssignVariableOp9assignvariableop_23_batch_normalization_3_moving_varianceIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_24AssignVariableOp0assignvariableop_24_convolutional_layer_4_kernelIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_25AssignVariableOp.assignvariableop_25_convolutional_layer_4_biasIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_26AssignVariableOp/assignvariableop_26_batch_normalization_4_gammaIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_27AssignVariableOp.assignvariableop_27_batch_normalization_4_betaIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_28AssignVariableOp5assignvariableop_28_batch_normalization_4_moving_meanIdentity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_29AssignVariableOp9assignvariableop_29_batch_normalization_4_moving_varianceIdentity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_30AssignVariableOp0assignvariableop_30_convolutional_layer_5_kernelIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_31AssignVariableOp.assignvariableop_31_convolutional_layer_5_biasIdentity_31:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_32AssignVariableOp/assignvariableop_32_batch_normalization_5_gammaIdentity_32:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_33AssignVariableOp.assignvariableop_33_batch_normalization_5_betaIdentity_33:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_34AssignVariableOp5assignvariableop_34_batch_normalization_5_moving_meanIdentity_34:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_35AssignVariableOp9assignvariableop_35_batch_normalization_5_moving_varianceIdentity_35:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_36AssignVariableOp4assignvariableop_36_value_convolutional_layer_kernelIdentity_36:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_37AssignVariableOp2assignvariableop_37_value_convolutional_layer_biasIdentity_37:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_38AssignVariableOp7assignvariableop_38_policy_convolutional_layer_1_kernelIdentity_38:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_39IdentityRestoreV2:tensors:39"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_39AssignVariableOp5assignvariableop_39_policy_convolutional_layer_1_biasIdentity_39:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_40IdentityRestoreV2:tensors:40"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_40AssignVariableOp5assignvariableop_40_value_batch_normalization_1_gammaIdentity_40:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_41IdentityRestoreV2:tensors:41"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_41AssignVariableOp4assignvariableop_41_value_batch_normalization_1_betaIdentity_41:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_42IdentityRestoreV2:tensors:42"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_42AssignVariableOp;assignvariableop_42_value_batch_normalization_1_moving_meanIdentity_42:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_43IdentityRestoreV2:tensors:43"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_43AssignVariableOp?assignvariableop_43_value_batch_normalization_1_moving_varianceIdentity_43:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_44IdentityRestoreV2:tensors:44"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_44AssignVariableOp6assignvariableop_44_policy_batch_normalization_1_gammaIdentity_44:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_45IdentityRestoreV2:tensors:45"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_45AssignVariableOp5assignvariableop_45_policy_batch_normalization_1_betaIdentity_45:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_46IdentityRestoreV2:tensors:46"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_46AssignVariableOp<assignvariableop_46_policy_batch_normalization_1_moving_meanIdentity_46:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_47IdentityRestoreV2:tensors:47"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_47AssignVariableOp@assignvariableop_47_policy_batch_normalization_1_moving_varianceIdentity_47:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_48IdentityRestoreV2:tensors:48"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_48AssignVariableOp7assignvariableop_48_policy_convolutional_layer_2_kernelIdentity_48:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_49IdentityRestoreV2:tensors:49"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_49AssignVariableOp5assignvariableop_49_policy_convolutional_layer_2_biasIdentity_49:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_50IdentityRestoreV2:tensors:50"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_50AssignVariableOp,assignvariableop_50_value_dense_layer_kernelIdentity_50:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_51IdentityRestoreV2:tensors:51"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_51AssignVariableOp*assignvariableop_51_value_dense_layer_biasIdentity_51:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_52IdentityRestoreV2:tensors:52"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_52AssignVariableOp6assignvariableop_52_policy_batch_normalization_2_gammaIdentity_52:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_53IdentityRestoreV2:tensors:53"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_53AssignVariableOp5assignvariableop_53_policy_batch_normalization_2_betaIdentity_53:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_54IdentityRestoreV2:tensors:54"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_54AssignVariableOp<assignvariableop_54_policy_batch_normalization_2_moving_meanIdentity_54:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_55IdentityRestoreV2:tensors:55"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_55AssignVariableOp@assignvariableop_55_policy_batch_normalization_2_moving_varianceIdentity_55:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_56IdentityRestoreV2:tensors:56"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_56AssignVariableOp5assignvariableop_56_value_batch_normalization_2_gammaIdentity_56:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_57IdentityRestoreV2:tensors:57"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_57AssignVariableOp4assignvariableop_57_value_batch_normalization_2_betaIdentity_57:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_58IdentityRestoreV2:tensors:58"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_58AssignVariableOp;assignvariableop_58_value_batch_normalization_2_moving_meanIdentity_58:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_59IdentityRestoreV2:tensors:59"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_59AssignVariableOp?assignvariableop_59_value_batch_normalization_2_moving_varianceIdentity_59:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_60IdentityRestoreV2:tensors:60"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_60AssignVariableOp%assignvariableop_60_value_head_kernelIdentity_60:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_61IdentityRestoreV2:tensors:61"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_61AssignVariableOp#assignvariableop_61_value_head_biasIdentity_61:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_62IdentityRestoreV2:tensors:62"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_62AssignVariableOp&assignvariableop_62_policy_head_kernelIdentity_62:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_63IdentityRestoreV2:tensors:63"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_63AssignVariableOp$assignvariableop_63_policy_head_biasIdentity_63:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_64IdentityRestoreV2:tensors:64"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_64AssignVariableOpassignvariableop_64_totalIdentity_64:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_65IdentityRestoreV2:tensors:65"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_65AssignVariableOpassignvariableop_65_countIdentity_65:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_66IdentityRestoreV2:tensors:66"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_66AssignVariableOpassignvariableop_66_total_1Identity_66:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_67IdentityRestoreV2:tensors:67"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_67AssignVariableOpassignvariableop_67_count_1Identity_67:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_68IdentityRestoreV2:tensors:68"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_68AssignVariableOpassignvariableop_68_total_2Identity_68:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_69IdentityRestoreV2:tensors:69"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_69AssignVariableOpassignvariableop_69_count_2Identity_69:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 �
Identity_70Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_56^AssignVariableOp_57^AssignVariableOp_58^AssignVariableOp_59^AssignVariableOp_6^AssignVariableOp_60^AssignVariableOp_61^AssignVariableOp_62^AssignVariableOp_63^AssignVariableOp_64^AssignVariableOp_65^AssignVariableOp_66^AssignVariableOp_67^AssignVariableOp_68^AssignVariableOp_69^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_71IdentityIdentity_70:output:0^NoOp_1*
T0*
_output_shapes
: �
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_56^AssignVariableOp_57^AssignVariableOp_58^AssignVariableOp_59^AssignVariableOp_6^AssignVariableOp_60^AssignVariableOp_61^AssignVariableOp_62^AssignVariableOp_63^AssignVariableOp_64^AssignVariableOp_65^AssignVariableOp_66^AssignVariableOp_67^AssignVariableOp_68^AssignVariableOp_69^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_71Identity_71:output:0*�
_input_shapes�
�: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322*
AssignVariableOp_33AssignVariableOp_332*
AssignVariableOp_34AssignVariableOp_342*
AssignVariableOp_35AssignVariableOp_352*
AssignVariableOp_36AssignVariableOp_362*
AssignVariableOp_37AssignVariableOp_372*
AssignVariableOp_38AssignVariableOp_382*
AssignVariableOp_39AssignVariableOp_392(
AssignVariableOp_4AssignVariableOp_42*
AssignVariableOp_40AssignVariableOp_402*
AssignVariableOp_41AssignVariableOp_412*
AssignVariableOp_42AssignVariableOp_422*
AssignVariableOp_43AssignVariableOp_432*
AssignVariableOp_44AssignVariableOp_442*
AssignVariableOp_45AssignVariableOp_452*
AssignVariableOp_46AssignVariableOp_462*
AssignVariableOp_47AssignVariableOp_472*
AssignVariableOp_48AssignVariableOp_482*
AssignVariableOp_49AssignVariableOp_492(
AssignVariableOp_5AssignVariableOp_52*
AssignVariableOp_50AssignVariableOp_502*
AssignVariableOp_51AssignVariableOp_512*
AssignVariableOp_52AssignVariableOp_522*
AssignVariableOp_53AssignVariableOp_532*
AssignVariableOp_54AssignVariableOp_542*
AssignVariableOp_55AssignVariableOp_552*
AssignVariableOp_56AssignVariableOp_562*
AssignVariableOp_57AssignVariableOp_572*
AssignVariableOp_58AssignVariableOp_582*
AssignVariableOp_59AssignVariableOp_592(
AssignVariableOp_6AssignVariableOp_62*
AssignVariableOp_60AssignVariableOp_602*
AssignVariableOp_61AssignVariableOp_612*
AssignVariableOp_62AssignVariableOp_622*
AssignVariableOp_63AssignVariableOp_632*
AssignVariableOp_64AssignVariableOp_642*
AssignVariableOp_65AssignVariableOp_652*
AssignVariableOp_66AssignVariableOp_662*
AssignVariableOp_67AssignVariableOp_672*
AssignVariableOp_68AssignVariableOp_682*
AssignVariableOp_69AssignVariableOp_692(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
�
�
E__inference_Policy_Head_layer_call_and_return_conditional_losses_8058

inputs1
matmul_readvariableop_resource:	?�.
biasadd_readvariableop_resource:	�
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�2Policy_Head/bias/Regularizer/Square/ReadVariableOp�4Policy_Head/kernel/Regularizer/Square/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	?�*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������W
SoftmaxSoftmaxBiasAdd:output:0*
T0*(
_output_shapes
:�����������
4Policy_Head/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	?�*
dtype0�
%Policy_Head/kernel/Regularizer/SquareSquare<Policy_Head/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?�u
$Policy_Head/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
"Policy_Head/kernel/Regularizer/SumSum)Policy_Head/kernel/Regularizer/Square:y:0-Policy_Head/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$Policy_Head/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
"Policy_Head/kernel/Regularizer/mulMul-Policy_Head/kernel/Regularizer/mul/x:output:0+Policy_Head/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
2Policy_Head/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0�
#Policy_Head/bias/Regularizer/SquareSquare:Policy_Head/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes	
:�l
"Policy_Head/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
 Policy_Head/bias/Regularizer/SumSum'Policy_Head/bias/Regularizer/Square:y:0+Policy_Head/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: g
"Policy_Head/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
 Policy_Head/bias/Regularizer/mulMul+Policy_Head/bias/Regularizer/mul/x:output:0)Policy_Head/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: a
IdentityIdentitySoftmax:softmax:0^NoOp*
T0*(
_output_shapes
:�����������
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp3^Policy_Head/bias/Regularizer/Square/ReadVariableOp5^Policy_Head/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������?: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2h
2Policy_Head/bias/Regularizer/Square/ReadVariableOp2Policy_Head/bias/Regularizer/Square/ReadVariableOp2l
4Policy_Head/kernel/Regularizer/Square/ReadVariableOp4Policy_Head/kernel/Regularizer/Square/ReadVariableOp:O K
'
_output_shapes
:���������?
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_7284

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
__inference_loss_fn_2_8091a
Gconvolutional_layer_1_kernel_regularizer_square_readvariableop_resource:
identity��>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp�
>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpGconvolutional_layer_1_kernel_regularizer_square_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_1/kernel/Regularizer/SquareSquareFConvolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_1/kernel/Regularizer/SumSum3Convolutional_Layer_1/kernel/Regularizer/Square:y:07Convolutional_Layer_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_1/kernel/Regularizer/mulMul7Convolutional_Layer_1/kernel/Regularizer/mul/x:output:05Convolutional_Layer_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: n
IdentityIdentity0Convolutional_Layer_1/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp?^Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2�
>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp
�
�
O__inference_Convolutional_Layer_0_layer_call_and_return_conditional_losses_6356

inputs9
conv2d_readvariableop_resource:�-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp}
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*'
_output_shapes
:�*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������	�
>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*'
_output_shapes
:�*
dtype0�
/Convolutional_Layer_0/kernel/Regularizer/SquareSquareFConvolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*'
_output_shapes
:��
.Convolutional_Layer_0/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_0/kernel/Regularizer/SumSum3Convolutional_Layer_0/kernel/Regularizer/Square:y:07Convolutional_Layer_0/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_0/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_0/kernel/Regularizer/mulMul7Convolutional_Layer_0/kernel/Regularizer/mul/x:output:05Convolutional_Layer_0/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_0/bias/Regularizer/SquareSquareDConvolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_0/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_0/bias/Regularizer/SumSum1Convolutional_Layer_0/bias/Regularizer/Square:y:05Convolutional_Layer_0/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_0/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_0/bias/Regularizer/mulMul5Convolutional_Layer_0/bias/Regularizer/mul/x:output:03Convolutional_Layer_0/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp=^Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :���������	�: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2|
<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp:X T
0
_output_shapes
:���������	�
 
_user_specified_nameinputs
�
�
;__inference_Policy_Batch_Normalization_2_layer_call_fn_7807

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_3222w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
&__inference_model_1_layer_call_fn_5405

inputs"
unknown:�
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:#
	unknown_5:
	unknown_6:
	unknown_7:
	unknown_8:
	unknown_9:

unknown_10:$

unknown_11:

unknown_12:

unknown_13:

unknown_14:

unknown_15:

unknown_16:$

unknown_17:

unknown_18:

unknown_19:

unknown_20:

unknown_21:

unknown_22:$

unknown_23:

unknown_24:

unknown_25:

unknown_26:

unknown_27:

unknown_28:$

unknown_29:

unknown_30:

unknown_31:

unknown_32:

unknown_33:

unknown_34:$

unknown_35:

unknown_36:$

unknown_37:

unknown_38:

unknown_39:

unknown_40:

unknown_41:

unknown_42:

unknown_43:

unknown_44:

unknown_45:

unknown_46:$

unknown_47:

unknown_48:

unknown_49:

unknown_50:

unknown_51:

unknown_52:

unknown_53:?@

unknown_54:@

unknown_55:@

unknown_56:@

unknown_57:@

unknown_58:@

unknown_59:	?�

unknown_60:	�

unknown_61:@

unknown_62:
identity

identity_1��StatefulPartitionedCall�	
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32
unknown_33
unknown_34
unknown_35
unknown_36
unknown_37
unknown_38
unknown_39
unknown_40
unknown_41
unknown_42
unknown_43
unknown_44
unknown_45
unknown_46
unknown_47
unknown_48
unknown_49
unknown_50
unknown_51
unknown_52
unknown_53
unknown_54
unknown_55
unknown_56
unknown_57
unknown_58
unknown_59
unknown_60
unknown_61
unknown_62*L
TinE
C2A*
Tout
2*
_collective_manager_ids
 *;
_output_shapes)
':���������:����������*b
_read_only_resource_inputsD
B@	
 !"#$%&'()*+,-./0123456789:;<=>?@*-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_model_1_layer_call_and_return_conditional_losses_3020o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������r

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*(
_output_shapes
:����������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������	�: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:���������	�
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_6612

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
K__inference_Value_Dense_Layer_layer_call_and_return_conditional_losses_7755

inputs0
matmul_readvariableop_resource:?@-
biasadd_readvariableop_resource:@
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp�:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:?@*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������@�
:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:?@*
dtype0�
+Value_Dense_Layer/kernel/Regularizer/SquareSquareBValue_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:?@{
*Value_Dense_Layer/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
(Value_Dense_Layer/kernel/Regularizer/SumSum/Value_Dense_Layer/kernel/Regularizer/Square:y:03Value_Dense_Layer/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: o
*Value_Dense_Layer/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
(Value_Dense_Layer/kernel/Regularizer/mulMul3Value_Dense_Layer/kernel/Regularizer/mul/x:output:01Value_Dense_Layer/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
)Value_Dense_Layer/bias/Regularizer/SquareSquare@Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:@r
(Value_Dense_Layer/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
&Value_Dense_Layer/bias/Regularizer/SumSum-Value_Dense_Layer/bias/Regularizer/Square:y:01Value_Dense_Layer/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: m
(Value_Dense_Layer/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
&Value_Dense_Layer/bias/Regularizer/mulMul1Value_Dense_Layer/bias/Regularizer/mul/x:output:0/Value_Dense_Layer/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������@�
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp9^Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp;^Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������?: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2t
8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp2x
:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp:O K
'
_output_shapes
:���������?
 
_user_specified_nameinputs
�
�
;__inference_Policy_Batch_Normalization_1_layer_call_fn_7571

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_2669w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
E__inference_Policy_Head_layer_call_and_return_conditional_losses_2839

inputs1
matmul_readvariableop_resource:	?�.
biasadd_readvariableop_resource:	�
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�2Policy_Head/bias/Regularizer/Square/ReadVariableOp�4Policy_Head/kernel/Regularizer/Square/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	?�*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������W
SoftmaxSoftmaxBiasAdd:output:0*
T0*(
_output_shapes
:�����������
4Policy_Head/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	?�*
dtype0�
%Policy_Head/kernel/Regularizer/SquareSquare<Policy_Head/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?�u
$Policy_Head/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
"Policy_Head/kernel/Regularizer/SumSum)Policy_Head/kernel/Regularizer/Square:y:0-Policy_Head/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$Policy_Head/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
"Policy_Head/kernel/Regularizer/mulMul-Policy_Head/kernel/Regularizer/mul/x:output:0+Policy_Head/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
2Policy_Head/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0�
#Policy_Head/bias/Regularizer/SquareSquare:Policy_Head/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes	
:�l
"Policy_Head/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
 Policy_Head/bias/Regularizer/SumSum'Policy_Head/bias/Regularizer/Square:y:0+Policy_Head/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: g
"Policy_Head/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
 Policy_Head/bias/Regularizer/mulMul+Policy_Head/bias/Regularizer/mul/x:output:0)Policy_Head/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: a
IdentityIdentitySoftmax:softmax:0^NoOp*
T0*(
_output_shapes
:�����������
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp3^Policy_Head/bias/Regularizer/Square/ReadVariableOp5^Policy_Head/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������?: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2h
2Policy_Head/bias/Regularizer/Square/ReadVariableOp2Policy_Head/bias/Regularizer/Square/ReadVariableOp2l
4Policy_Head/kernel/Regularizer/Square/ReadVariableOp4Policy_Head/kernel/Regularizer/Square/ReadVariableOp:O K
'
_output_shapes
:���������?
 
_user_specified_nameinputs
�
�
__inference_loss_fn_5_8124S
Econvolutional_layer_2_bias_regularizer_square_readvariableop_resource:
identity��<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp�
<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpReadVariableOpEconvolutional_layer_2_bias_regularizer_square_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_2/bias/Regularizer/SquareSquareDConvolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_2/bias/Regularizer/SumSum1Convolutional_Layer_2/bias/Regularizer/Square:y:05Convolutional_Layer_2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_2/bias/Regularizer/mulMul5Convolutional_Layer_2/bias/Regularizer/mul/x:output:03Convolutional_Layer_2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: l
IdentityIdentity.Convolutional_Layer_2/bias/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp=^Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2|
<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp
�
�
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_2127

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_7098

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_2669

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_7302

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
S__inference_Value_Convolutional_Layer_layer_call_and_return_conditional_losses_2646

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp�BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������	�
BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
3Value_Convolutional_Layer/kernel/Regularizer/SquareSquareJValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
2Value_Convolutional_Layer/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
0Value_Convolutional_Layer/kernel/Regularizer/SumSum7Value_Convolutional_Layer/kernel/Regularizer/Square:y:0;Value_Convolutional_Layer/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: w
2Value_Convolutional_Layer/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
0Value_Convolutional_Layer/kernel/Regularizer/mulMul;Value_Convolutional_Layer/kernel/Regularizer/mul/x:output:09Value_Convolutional_Layer/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
1Value_Convolutional_Layer/bias/Regularizer/SquareSquareHValue_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:z
0Value_Convolutional_Layer/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
.Value_Convolutional_Layer/bias/Regularizer/SumSum5Value_Convolutional_Layer/bias/Regularizer/Square:y:09Value_Convolutional_Layer/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: u
0Value_Convolutional_Layer/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
.Value_Convolutional_Layer/bias/Regularizer/mulMul9Value_Convolutional_Layer/bias/Regularizer/mul/x:output:07Value_Convolutional_Layer/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOpA^Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOpC^Value_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2�
@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp2�
BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOpBValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_2360

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
j
N__inference_Policy_Flatten_Layer_layer_call_and_return_conditional_losses_2805

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"����?   \
ReshapeReshapeinputsConst:output:0*
T0*'
_output_shapes
:���������?X
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:���������?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�	
�
4__inference_Batch_Normalization_3_layer_call_fn_6873

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_1807�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_7602

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_7320

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
__inference_loss_fn_4_8113a
Gconvolutional_layer_2_kernel_regularizer_square_readvariableop_resource:
identity��>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp�
>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpGconvolutional_layer_2_kernel_regularizer_square_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_2/kernel/Regularizer/SquareSquareFConvolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_2/kernel/Regularizer/SumSum3Convolutional_Layer_2/kernel/Regularizer/Square:y:07Convolutional_Layer_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_2/kernel/Regularizer/mulMul7Convolutional_Layer_2/kernel/Regularizer/mul/x:output:05Convolutional_Layer_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: n
IdentityIdentity0Convolutional_Layer_2/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp?^Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2�
>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp
�
�
0__inference_Value_Dense_Layer_layer_call_fn_7732

inputs
unknown:?@
	unknown_0:@
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_Value_Dense_Layer_layer_call_and_return_conditional_losses_2793o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������?: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������?
 
_user_specified_nameinputs
�
�
__inference_loss_fn_20_8289N
<value_head_kernel_regularizer_square_readvariableop_resource:@
identity��3Value_Head/kernel/Regularizer/Square/ReadVariableOp�
3Value_Head/kernel/Regularizer/Square/ReadVariableOpReadVariableOp<value_head_kernel_regularizer_square_readvariableop_resource*
_output_shapes

:@*
dtype0�
$Value_Head/kernel/Regularizer/SquareSquare;Value_Head/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@t
#Value_Head/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
!Value_Head/kernel/Regularizer/SumSum(Value_Head/kernel/Regularizer/Square:y:0,Value_Head/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: h
#Value_Head/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
!Value_Head/kernel/Regularizer/mulMul,Value_Head/kernel/Regularizer/mul/x:output:0*Value_Head/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: c
IdentityIdentity%Value_Head/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: |
NoOpNoOp4^Value_Head/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2j
3Value_Head/kernel/Regularizer/Square/ReadVariableOp3Value_Head/kernel/Regularizer/Square/ReadVariableOp
�
�
U__inference_Value_Batch_Normalization_2_layer_call_and_return_conditional_losses_2193

inputs/
!batchnorm_readvariableop_resource:@3
%batchnorm_mul_readvariableop_resource:@1
#batchnorm_readvariableop_1_resource:@1
#batchnorm_readvariableop_2_resource:@
identity��batchnorm/ReadVariableOp�batchnorm/ReadVariableOp_1�batchnorm/ReadVariableOp_2�batchnorm/mul/ReadVariableOpv
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:@*
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:w
batchnorm/addAddV2 batchnorm/ReadVariableOp:value:0batchnorm/add/y:output:0*
T0*
_output_shapes
:@P
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
:@~
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
:@*
dtype0t
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:@c
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:���������@z
batchnorm/ReadVariableOp_1ReadVariableOp#batchnorm_readvariableop_1_resource*
_output_shapes
:@*
dtype0r
batchnorm/mul_2Mul"batchnorm/ReadVariableOp_1:value:0batchnorm/mul:z:0*
T0*
_output_shapes
:@z
batchnorm/ReadVariableOp_2ReadVariableOp#batchnorm_readvariableop_2_resource*
_output_shapes
:@*
dtype0r
batchnorm/subSub"batchnorm/ReadVariableOp_2:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
:@r
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:���������@b
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:���������@�
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������@: : : : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
�	
�
4__inference_Batch_Normalization_2_layer_call_fn_6718

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_1774�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�	
�
;__inference_Policy_Batch_Normalization_2_layer_call_fn_7781

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_2158�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
__inference_loss_fn_0_8069b
Gconvolutional_layer_0_kernel_regularizer_square_readvariableop_resource:�
identity��>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp�
>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOpReadVariableOpGconvolutional_layer_0_kernel_regularizer_square_readvariableop_resource*'
_output_shapes
:�*
dtype0�
/Convolutional_Layer_0/kernel/Regularizer/SquareSquareFConvolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*'
_output_shapes
:��
.Convolutional_Layer_0/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_0/kernel/Regularizer/SumSum3Convolutional_Layer_0/kernel/Regularizer/Square:y:07Convolutional_Layer_0/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_0/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_0/kernel/Regularizer/mulMul7Convolutional_Layer_0/kernel/Regularizer/mul/x:output:05Convolutional_Layer_0/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: n
IdentityIdentity0Convolutional_Layer_0/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp?^Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2�
>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp
�
�
O__inference_Convolutional_Layer_4_layer_call_and_return_conditional_losses_7028

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������	�
>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_4/kernel/Regularizer/SquareSquareFConvolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_4/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_4/kernel/Regularizer/SumSum3Convolutional_Layer_4/kernel/Regularizer/Square:y:07Convolutional_Layer_4/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_4/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_4/kernel/Regularizer/mulMul7Convolutional_Layer_4/kernel/Regularizer/mul/x:output:05Convolutional_Layer_4/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_4/bias/Regularizer/SquareSquareDConvolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_4/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_4/bias/Regularizer/SumSum1Convolutional_Layer_4/bias/Regularizer/Square:y:05Convolutional_Layer_4/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_4/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_4/bias/Regularizer/mulMul5Convolutional_Layer_4/bias/Regularizer/mul/x:output:03Convolutional_Layer_4/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp=^Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2|
<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
4__inference_Convolutional_Layer_2_layer_call_fn_6669

inputs!
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_2_layer_call_and_return_conditional_losses_2393w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_1710

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
;__inference_Policy_Batch_Normalization_2_layer_call_fn_7794

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_2760w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_2158

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
__inference_loss_fn_6_8135a
Gconvolutional_layer_3_kernel_regularizer_square_readvariableop_resource:
identity��>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp�
>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOpReadVariableOpGconvolutional_layer_3_kernel_regularizer_square_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_3/kernel/Regularizer/SquareSquareFConvolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_3/kernel/Regularizer/SumSum3Convolutional_Layer_3/kernel/Regularizer/Square:y:07Convolutional_Layer_3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_3/kernel/Regularizer/mulMul7Convolutional_Layer_3/kernel/Regularizer/mul/x:output:05Convolutional_Layer_3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: n
IdentityIdentity0Convolutional_Layer_3/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp?^Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2�
>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp
�
�
K__inference_Value_Dense_Layer_layer_call_and_return_conditional_losses_2793

inputs0
matmul_readvariableop_resource:?@-
biasadd_readvariableop_resource:@
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp�:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:?@*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������@�
:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:?@*
dtype0�
+Value_Dense_Layer/kernel/Regularizer/SquareSquareBValue_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:?@{
*Value_Dense_Layer/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
(Value_Dense_Layer/kernel/Regularizer/SumSum/Value_Dense_Layer/kernel/Regularizer/Square:y:03Value_Dense_Layer/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: o
*Value_Dense_Layer/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
(Value_Dense_Layer/kernel/Regularizer/mulMul3Value_Dense_Layer/kernel/Regularizer/mul/x:output:01Value_Dense_Layer/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
)Value_Dense_Layer/bias/Regularizer/SquareSquare@Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:@r
(Value_Dense_Layer/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
&Value_Dense_Layer/bias/Regularizer/SumSum-Value_Dense_Layer/bias/Regularizer/Square:y:01Value_Dense_Layer/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: m
(Value_Dense_Layer/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
&Value_Dense_Layer/bias/Regularizer/mulMul1Value_Dense_Layer/bias/Regularizer/mul/x:output:0/Value_Dense_Layer/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������@�
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp9^Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp;^Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������?: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2t
8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp2x
:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp:O K
'
_output_shapes
:���������?
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_3606

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
N
2__inference_Value_Flatten_Layer_layer_call_fn_7661

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_Value_Flatten_Layer_layer_call_and_return_conditional_losses_2741`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:���������?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
4__inference_Batch_Normalization_3_layer_call_fn_6899

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_2472w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�	
�
4__inference_Batch_Normalization_5_layer_call_fn_7222

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_1966�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
__inference_loss_fn_14_8223h
Npolicy_convolutional_layer_1_kernel_regularizer_square_readvariableop_resource:
identity��EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp�
EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpNpolicy_convolutional_layer_1_kernel_regularizer_square_readvariableop_resource*&
_output_shapes
:*
dtype0�
6Policy_Convolutional_Layer_1/kernel/Regularizer/SquareSquareMPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
5Policy_Convolutional_Layer_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3Policy_Convolutional_Layer_1/kernel/Regularizer/SumSum:Policy_Convolutional_Layer_1/kernel/Regularizer/Square:y:0>Policy_Convolutional_Layer_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5Policy_Convolutional_Layer_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
3Policy_Convolutional_Layer_1/kernel/Regularizer/mulMul>Policy_Convolutional_Layer_1/kernel/Regularizer/mul/x:output:0<Policy_Convolutional_Layer_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: u
IdentityIdentity7Policy_Convolutional_Layer_1/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOpF^Policy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2�
EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpEPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp
�
�
__inference_loss_fn_22_8311P
=policy_head_kernel_regularizer_square_readvariableop_resource:	?�
identity��4Policy_Head/kernel/Regularizer/Square/ReadVariableOp�
4Policy_Head/kernel/Regularizer/Square/ReadVariableOpReadVariableOp=policy_head_kernel_regularizer_square_readvariableop_resource*
_output_shapes
:	?�*
dtype0�
%Policy_Head/kernel/Regularizer/SquareSquare<Policy_Head/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?�u
$Policy_Head/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
"Policy_Head/kernel/Regularizer/SumSum)Policy_Head/kernel/Regularizer/Square:y:0-Policy_Head/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$Policy_Head/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
"Policy_Head/kernel/Regularizer/mulMul-Policy_Head/kernel/Regularizer/mul/x:output:0+Policy_Head/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: d
IdentityIdentity&Policy_Head/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: }
NoOpNoOp5^Policy_Head/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2l
4Policy_Head/kernel/Regularizer/Square/ReadVariableOp4Policy_Head/kernel/Regularizer/Square/ReadVariableOp
�
�
;__inference_Policy_Convolutional_Layer_1_layer_call_fn_7385

inputs!
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Convolutional_Layer_1_layer_call_and_return_conditional_losses_2617w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
:__inference_Value_Batch_Normalization_1_layer_call_fn_7447

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *^
fYRW
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_2696w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
4__inference_Batch_Normalization_0_layer_call_fn_6395

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_2304w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
__inference_loss_fn_11_8190S
Econvolutional_layer_5_bias_regularizer_square_readvariableop_resource:
identity��<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp�
<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOpReadVariableOpEconvolutional_layer_5_bias_regularizer_square_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_5/bias/Regularizer/SquareSquareDConvolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_5/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_5/bias/Regularizer/SumSum1Convolutional_Layer_5/bias/Regularizer/Square:y:05Convolutional_Layer_5/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_5/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_5/bias/Regularizer/mulMul5Convolutional_Layer_5/bias/Regularizer/mul/x:output:03Convolutional_Layer_5/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: l
IdentityIdentity.Convolutional_Layer_5/bias/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp=^Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2|
<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp
�
�
O__inference_Convolutional_Layer_3_layer_call_and_return_conditional_losses_2449

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������	�
>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_3/kernel/Regularizer/SquareSquareFConvolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_3/kernel/Regularizer/SumSum3Convolutional_Layer_3/kernel/Regularizer/Square:y:07Convolutional_Layer_3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_3/kernel/Regularizer/mulMul7Convolutional_Layer_3/kernel/Regularizer/mul/x:output:05Convolutional_Layer_3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_3/bias/Regularizer/SquareSquareDConvolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_3/bias/Regularizer/SumSum1Convolutional_Layer_3/bias/Regularizer/Square:y:05Convolutional_Layer_3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_3/bias/Regularizer/mulMul5Convolutional_Layer_3/bias/Regularizer/mul/x:output:03Convolutional_Layer_3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp=^Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2|
<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_3444

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
��
�"
__inference__traced_save_8556
file_prefix;
7savev2_convolutional_layer_0_kernel_read_readvariableop9
5savev2_convolutional_layer_0_bias_read_readvariableop:
6savev2_batch_normalization_0_gamma_read_readvariableop9
5savev2_batch_normalization_0_beta_read_readvariableop@
<savev2_batch_normalization_0_moving_mean_read_readvariableopD
@savev2_batch_normalization_0_moving_variance_read_readvariableop;
7savev2_convolutional_layer_1_kernel_read_readvariableop9
5savev2_convolutional_layer_1_bias_read_readvariableop:
6savev2_batch_normalization_1_gamma_read_readvariableop9
5savev2_batch_normalization_1_beta_read_readvariableop@
<savev2_batch_normalization_1_moving_mean_read_readvariableopD
@savev2_batch_normalization_1_moving_variance_read_readvariableop;
7savev2_convolutional_layer_2_kernel_read_readvariableop9
5savev2_convolutional_layer_2_bias_read_readvariableop:
6savev2_batch_normalization_2_gamma_read_readvariableop9
5savev2_batch_normalization_2_beta_read_readvariableop@
<savev2_batch_normalization_2_moving_mean_read_readvariableopD
@savev2_batch_normalization_2_moving_variance_read_readvariableop;
7savev2_convolutional_layer_3_kernel_read_readvariableop9
5savev2_convolutional_layer_3_bias_read_readvariableop:
6savev2_batch_normalization_3_gamma_read_readvariableop9
5savev2_batch_normalization_3_beta_read_readvariableop@
<savev2_batch_normalization_3_moving_mean_read_readvariableopD
@savev2_batch_normalization_3_moving_variance_read_readvariableop;
7savev2_convolutional_layer_4_kernel_read_readvariableop9
5savev2_convolutional_layer_4_bias_read_readvariableop:
6savev2_batch_normalization_4_gamma_read_readvariableop9
5savev2_batch_normalization_4_beta_read_readvariableop@
<savev2_batch_normalization_4_moving_mean_read_readvariableopD
@savev2_batch_normalization_4_moving_variance_read_readvariableop;
7savev2_convolutional_layer_5_kernel_read_readvariableop9
5savev2_convolutional_layer_5_bias_read_readvariableop:
6savev2_batch_normalization_5_gamma_read_readvariableop9
5savev2_batch_normalization_5_beta_read_readvariableop@
<savev2_batch_normalization_5_moving_mean_read_readvariableopD
@savev2_batch_normalization_5_moving_variance_read_readvariableop?
;savev2_value_convolutional_layer_kernel_read_readvariableop=
9savev2_value_convolutional_layer_bias_read_readvariableopB
>savev2_policy_convolutional_layer_1_kernel_read_readvariableop@
<savev2_policy_convolutional_layer_1_bias_read_readvariableop@
<savev2_value_batch_normalization_1_gamma_read_readvariableop?
;savev2_value_batch_normalization_1_beta_read_readvariableopF
Bsavev2_value_batch_normalization_1_moving_mean_read_readvariableopJ
Fsavev2_value_batch_normalization_1_moving_variance_read_readvariableopA
=savev2_policy_batch_normalization_1_gamma_read_readvariableop@
<savev2_policy_batch_normalization_1_beta_read_readvariableopG
Csavev2_policy_batch_normalization_1_moving_mean_read_readvariableopK
Gsavev2_policy_batch_normalization_1_moving_variance_read_readvariableopB
>savev2_policy_convolutional_layer_2_kernel_read_readvariableop@
<savev2_policy_convolutional_layer_2_bias_read_readvariableop7
3savev2_value_dense_layer_kernel_read_readvariableop5
1savev2_value_dense_layer_bias_read_readvariableopA
=savev2_policy_batch_normalization_2_gamma_read_readvariableop@
<savev2_policy_batch_normalization_2_beta_read_readvariableopG
Csavev2_policy_batch_normalization_2_moving_mean_read_readvariableopK
Gsavev2_policy_batch_normalization_2_moving_variance_read_readvariableop@
<savev2_value_batch_normalization_2_gamma_read_readvariableop?
;savev2_value_batch_normalization_2_beta_read_readvariableopF
Bsavev2_value_batch_normalization_2_moving_mean_read_readvariableopJ
Fsavev2_value_batch_normalization_2_moving_variance_read_readvariableop0
,savev2_value_head_kernel_read_readvariableop.
*savev2_value_head_bias_read_readvariableop1
-savev2_policy_head_kernel_read_readvariableop/
+savev2_policy_head_bias_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop&
"savev2_total_1_read_readvariableop&
"savev2_count_1_read_readvariableop&
"savev2_total_2_read_readvariableop&
"savev2_count_2_read_readvariableop
savev2_const

identity_1��MergeV2Checkpointsw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part�
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : �
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: � 
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:G*
dtype0*�
value�B�GB6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-1/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-1/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-1/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-3/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-5/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-7/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-7/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-7/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-7/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-8/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-8/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-9/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-9/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-9/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-9/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-10/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-10/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-11/gamma/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-11/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-11/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-11/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-12/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-12/bias/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-13/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-13/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-14/gamma/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-14/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-14/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-14/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-15/gamma/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-15/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-15/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-15/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-16/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-16/bias/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-17/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-17/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-18/gamma/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-18/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-18/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-18/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-19/gamma/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-19/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-19/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-19/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-20/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-20/bias/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-21/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-21/bias/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/2/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/2/count/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:G*
dtype0*�
value�B�GB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B �!
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:07savev2_convolutional_layer_0_kernel_read_readvariableop5savev2_convolutional_layer_0_bias_read_readvariableop6savev2_batch_normalization_0_gamma_read_readvariableop5savev2_batch_normalization_0_beta_read_readvariableop<savev2_batch_normalization_0_moving_mean_read_readvariableop@savev2_batch_normalization_0_moving_variance_read_readvariableop7savev2_convolutional_layer_1_kernel_read_readvariableop5savev2_convolutional_layer_1_bias_read_readvariableop6savev2_batch_normalization_1_gamma_read_readvariableop5savev2_batch_normalization_1_beta_read_readvariableop<savev2_batch_normalization_1_moving_mean_read_readvariableop@savev2_batch_normalization_1_moving_variance_read_readvariableop7savev2_convolutional_layer_2_kernel_read_readvariableop5savev2_convolutional_layer_2_bias_read_readvariableop6savev2_batch_normalization_2_gamma_read_readvariableop5savev2_batch_normalization_2_beta_read_readvariableop<savev2_batch_normalization_2_moving_mean_read_readvariableop@savev2_batch_normalization_2_moving_variance_read_readvariableop7savev2_convolutional_layer_3_kernel_read_readvariableop5savev2_convolutional_layer_3_bias_read_readvariableop6savev2_batch_normalization_3_gamma_read_readvariableop5savev2_batch_normalization_3_beta_read_readvariableop<savev2_batch_normalization_3_moving_mean_read_readvariableop@savev2_batch_normalization_3_moving_variance_read_readvariableop7savev2_convolutional_layer_4_kernel_read_readvariableop5savev2_convolutional_layer_4_bias_read_readvariableop6savev2_batch_normalization_4_gamma_read_readvariableop5savev2_batch_normalization_4_beta_read_readvariableop<savev2_batch_normalization_4_moving_mean_read_readvariableop@savev2_batch_normalization_4_moving_variance_read_readvariableop7savev2_convolutional_layer_5_kernel_read_readvariableop5savev2_convolutional_layer_5_bias_read_readvariableop6savev2_batch_normalization_5_gamma_read_readvariableop5savev2_batch_normalization_5_beta_read_readvariableop<savev2_batch_normalization_5_moving_mean_read_readvariableop@savev2_batch_normalization_5_moving_variance_read_readvariableop;savev2_value_convolutional_layer_kernel_read_readvariableop9savev2_value_convolutional_layer_bias_read_readvariableop>savev2_policy_convolutional_layer_1_kernel_read_readvariableop<savev2_policy_convolutional_layer_1_bias_read_readvariableop<savev2_value_batch_normalization_1_gamma_read_readvariableop;savev2_value_batch_normalization_1_beta_read_readvariableopBsavev2_value_batch_normalization_1_moving_mean_read_readvariableopFsavev2_value_batch_normalization_1_moving_variance_read_readvariableop=savev2_policy_batch_normalization_1_gamma_read_readvariableop<savev2_policy_batch_normalization_1_beta_read_readvariableopCsavev2_policy_batch_normalization_1_moving_mean_read_readvariableopGsavev2_policy_batch_normalization_1_moving_variance_read_readvariableop>savev2_policy_convolutional_layer_2_kernel_read_readvariableop<savev2_policy_convolutional_layer_2_bias_read_readvariableop3savev2_value_dense_layer_kernel_read_readvariableop1savev2_value_dense_layer_bias_read_readvariableop=savev2_policy_batch_normalization_2_gamma_read_readvariableop<savev2_policy_batch_normalization_2_beta_read_readvariableopCsavev2_policy_batch_normalization_2_moving_mean_read_readvariableopGsavev2_policy_batch_normalization_2_moving_variance_read_readvariableop<savev2_value_batch_normalization_2_gamma_read_readvariableop;savev2_value_batch_normalization_2_beta_read_readvariableopBsavev2_value_batch_normalization_2_moving_mean_read_readvariableopFsavev2_value_batch_normalization_2_moving_variance_read_readvariableop,savev2_value_head_kernel_read_readvariableop*savev2_value_head_bias_read_readvariableop-savev2_policy_head_kernel_read_readvariableop+savev2_policy_head_bias_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableop"savev2_total_2_read_readvariableop"savev2_count_2_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *U
dtypesK
I2G�
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:�
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 f
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: Q

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: [
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*�
_input_shapes�
�: :�::::::::::::::::::::::::::::::::::::::::::::::::::?@:@:::::@:@:@:@:@::	?�:�: : : : : : : 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:-)
'
_output_shapes
:�: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
::,(
&
_output_shapes
:: 

_output_shapes
:: 	

_output_shapes
:: 


_output_shapes
:: 

_output_shapes
:: 

_output_shapes
::,(
&
_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
::,(
&
_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
::,(
&
_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
::,(
&
_output_shapes
::  

_output_shapes
:: !

_output_shapes
:: "

_output_shapes
:: #

_output_shapes
:: $

_output_shapes
::,%(
&
_output_shapes
:: &

_output_shapes
::,'(
&
_output_shapes
:: (

_output_shapes
:: )

_output_shapes
:: *

_output_shapes
:: +

_output_shapes
:: ,

_output_shapes
:: -

_output_shapes
:: .

_output_shapes
:: /

_output_shapes
:: 0

_output_shapes
::,1(
&
_output_shapes
:: 2

_output_shapes
::$3 

_output_shapes

:?@: 4

_output_shapes
:@: 5

_output_shapes
:: 6

_output_shapes
:: 7

_output_shapes
:: 8

_output_shapes
:: 9

_output_shapes
:@: :

_output_shapes
:@: ;

_output_shapes
:@: <

_output_shapes
:@:$= 

_output_shapes

:@: >

_output_shapes
::%?!

_output_shapes
:	?�:!@

_output_shapes	
:�:A

_output_shapes
: :B

_output_shapes
: :C

_output_shapes
: :D

_output_shapes
: :E

_output_shapes
: :F

_output_shapes
: :G

_output_shapes
: 
�
�
;__inference_Policy_Batch_Normalization_1_layer_call_fn_7584

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_3326w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�	
�
4__inference_Batch_Normalization_4_layer_call_fn_7041

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_1871�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
4__inference_Batch_Normalization_4_layer_call_fn_7080

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_3444w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_6462

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
;__inference_Policy_Convolutional_Layer_2_layer_call_fn_7688

inputs!
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Convolutional_Layer_2_layer_call_and_return_conditional_losses_2729w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
__inference_loss_fn_3_8102S
Econvolutional_layer_1_bias_regularizer_square_readvariableop_resource:
identity��<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp�
<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpReadVariableOpEconvolutional_layer_1_bias_regularizer_square_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_1/bias/Regularizer/SquareSquareDConvolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_1/bias/Regularizer/SumSum1Convolutional_Layer_1/bias/Regularizer/Square:y:05Convolutional_Layer_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_1/bias/Regularizer/mulMul5Convolutional_Layer_1/bias/Regularizer/mul/x:output:03Convolutional_Layer_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: l
IdentityIdentity.Convolutional_Layer_1/bias/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp=^Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2|
<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp
�
�
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_2696

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_2584

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
��
�+
A__inference_model_1_layer_call_and_return_conditional_losses_4119

inputs5
convolutional_layer_0_3821:�(
convolutional_layer_0_3823:(
batch_normalization_0_3826:(
batch_normalization_0_3828:(
batch_normalization_0_3830:(
batch_normalization_0_3832:4
convolutional_layer_1_3835:(
convolutional_layer_1_3837:(
batch_normalization_1_3840:(
batch_normalization_1_3842:(
batch_normalization_1_3844:(
batch_normalization_1_3846:4
convolutional_layer_2_3849:(
convolutional_layer_2_3851:(
batch_normalization_2_3854:(
batch_normalization_2_3856:(
batch_normalization_2_3858:(
batch_normalization_2_3860:4
convolutional_layer_3_3863:(
convolutional_layer_3_3865:(
batch_normalization_3_3868:(
batch_normalization_3_3870:(
batch_normalization_3_3872:(
batch_normalization_3_3874:4
convolutional_layer_4_3877:(
convolutional_layer_4_3879:(
batch_normalization_4_3882:(
batch_normalization_4_3884:(
batch_normalization_4_3886:(
batch_normalization_4_3888:4
convolutional_layer_5_3891:(
convolutional_layer_5_3893:(
batch_normalization_5_3896:(
batch_normalization_5_3898:(
batch_normalization_5_3900:(
batch_normalization_5_3902:;
!policy_convolutional_layer_1_3905:/
!policy_convolutional_layer_1_3907:8
value_convolutional_layer_3910:,
value_convolutional_layer_3912:/
!policy_batch_normalization_1_3915:/
!policy_batch_normalization_1_3917:/
!policy_batch_normalization_1_3919:/
!policy_batch_normalization_1_3921:.
 value_batch_normalization_1_3924:.
 value_batch_normalization_1_3926:.
 value_batch_normalization_1_3928:.
 value_batch_normalization_1_3930:;
!policy_convolutional_layer_2_3933:/
!policy_convolutional_layer_2_3935:/
!policy_batch_normalization_2_3939:/
!policy_batch_normalization_2_3941:/
!policy_batch_normalization_2_3943:/
!policy_batch_normalization_2_3945:(
value_dense_layer_3948:?@$
value_dense_layer_3950:@.
 value_batch_normalization_2_3954:@.
 value_batch_normalization_2_3956:@.
 value_batch_normalization_2_3958:@.
 value_batch_normalization_2_3960:@#
policy_head_3963:	?�
policy_head_3965:	�!
value_head_3968:@
value_head_3970:
identity

identity_1��-Batch_Normalization_0/StatefulPartitionedCall�-Batch_Normalization_1/StatefulPartitionedCall�-Batch_Normalization_2/StatefulPartitionedCall�-Batch_Normalization_3/StatefulPartitionedCall�-Batch_Normalization_4/StatefulPartitionedCall�-Batch_Normalization_5/StatefulPartitionedCall�-Convolutional_Layer_0/StatefulPartitionedCall�<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp�-Convolutional_Layer_1/StatefulPartitionedCall�<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp�-Convolutional_Layer_2/StatefulPartitionedCall�<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp�-Convolutional_Layer_3/StatefulPartitionedCall�<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp�-Convolutional_Layer_4/StatefulPartitionedCall�<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp�-Convolutional_Layer_5/StatefulPartitionedCall�<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp�4Policy_Batch_Normalization_1/StatefulPartitionedCall�4Policy_Batch_Normalization_2/StatefulPartitionedCall�4Policy_Convolutional_Layer_1/StatefulPartitionedCall�CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp�EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp�4Policy_Convolutional_Layer_2/StatefulPartitionedCall�CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp�EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp�#Policy_Head/StatefulPartitionedCall�2Policy_Head/bias/Regularizer/Square/ReadVariableOp�4Policy_Head/kernel/Regularizer/Square/ReadVariableOp�3Value_Batch_Normalization_1/StatefulPartitionedCall�3Value_Batch_Normalization_2/StatefulPartitionedCall�1Value_Convolutional_Layer/StatefulPartitionedCall�@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp�BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp�)Value_Dense_Layer/StatefulPartitionedCall�8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp�:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp�"Value_Head/StatefulPartitionedCall�1Value_Head/bias/Regularizer/Square/ReadVariableOp�3Value_Head/kernel/Regularizer/Square/ReadVariableOp�
-Convolutional_Layer_0/StatefulPartitionedCallStatefulPartitionedCallinputsconvolutional_layer_0_3821convolutional_layer_0_3823*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_0_layer_call_and_return_conditional_losses_2281�
-Batch_Normalization_0/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_0/StatefulPartitionedCall:output:0batch_normalization_0_3826batch_normalization_0_3828batch_normalization_0_3830batch_normalization_0_3832*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_3660�
-Convolutional_Layer_1/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_0/StatefulPartitionedCall:output:0convolutional_layer_1_3835convolutional_layer_1_3837*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_1_layer_call_and_return_conditional_losses_2337�
-Batch_Normalization_1/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_1/StatefulPartitionedCall:output:0batch_normalization_1_3840batch_normalization_1_3842batch_normalization_1_3844batch_normalization_1_3846*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_3606�
-Convolutional_Layer_2/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_1/StatefulPartitionedCall:output:0convolutional_layer_2_3849convolutional_layer_2_3851*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_2_layer_call_and_return_conditional_losses_2393�
-Batch_Normalization_2/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_2/StatefulPartitionedCall:output:0batch_normalization_2_3854batch_normalization_2_3856batch_normalization_2_3858batch_normalization_2_3860*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_3552�
-Convolutional_Layer_3/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_2/StatefulPartitionedCall:output:0convolutional_layer_3_3863convolutional_layer_3_3865*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_3_layer_call_and_return_conditional_losses_2449�
-Batch_Normalization_3/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_3/StatefulPartitionedCall:output:0batch_normalization_3_3868batch_normalization_3_3870batch_normalization_3_3872batch_normalization_3_3874*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_3498�
-Convolutional_Layer_4/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_3/StatefulPartitionedCall:output:0convolutional_layer_4_3877convolutional_layer_4_3879*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_4_layer_call_and_return_conditional_losses_2505�
-Batch_Normalization_4/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_4/StatefulPartitionedCall:output:0batch_normalization_4_3882batch_normalization_4_3884batch_normalization_4_3886batch_normalization_4_3888*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_3444�
-Convolutional_Layer_5/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_4/StatefulPartitionedCall:output:0convolutional_layer_5_3891convolutional_layer_5_3893*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_5_layer_call_and_return_conditional_losses_2561�
-Batch_Normalization_5/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_5/StatefulPartitionedCall:output:0batch_normalization_5_3896batch_normalization_5_3898batch_normalization_5_3900batch_normalization_5_3902*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_3390�
4Policy_Convolutional_Layer_1/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_5/StatefulPartitionedCall:output:0!policy_convolutional_layer_1_3905!policy_convolutional_layer_1_3907*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Convolutional_Layer_1_layer_call_and_return_conditional_losses_2617�
1Value_Convolutional_Layer/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_5/StatefulPartitionedCall:output:0value_convolutional_layer_3910value_convolutional_layer_3912*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *\
fWRU
S__inference_Value_Convolutional_Layer_layer_call_and_return_conditional_losses_2646�
4Policy_Batch_Normalization_1/StatefulPartitionedCallStatefulPartitionedCall=Policy_Convolutional_Layer_1/StatefulPartitionedCall:output:0!policy_batch_normalization_1_3915!policy_batch_normalization_1_3917!policy_batch_normalization_1_3919!policy_batch_normalization_1_3921*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_3326�
3Value_Batch_Normalization_1/StatefulPartitionedCallStatefulPartitionedCall:Value_Convolutional_Layer/StatefulPartitionedCall:output:0 value_batch_normalization_1_3924 value_batch_normalization_1_3926 value_batch_normalization_1_3928 value_batch_normalization_1_3930*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *^
fYRW
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_3282�
4Policy_Convolutional_Layer_2/StatefulPartitionedCallStatefulPartitionedCall=Policy_Batch_Normalization_1/StatefulPartitionedCall:output:0!policy_convolutional_layer_2_3933!policy_convolutional_layer_2_3935*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Convolutional_Layer_2_layer_call_and_return_conditional_losses_2729�
#Value_Flatten_Layer/PartitionedCallPartitionedCall<Value_Batch_Normalization_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_Value_Flatten_Layer_layer_call_and_return_conditional_losses_2741�
4Policy_Batch_Normalization_2/StatefulPartitionedCallStatefulPartitionedCall=Policy_Convolutional_Layer_2/StatefulPartitionedCall:output:0!policy_batch_normalization_2_3939!policy_batch_normalization_2_3941!policy_batch_normalization_2_3943!policy_batch_normalization_2_3945*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_3222�
)Value_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall,Value_Flatten_Layer/PartitionedCall:output:0value_dense_layer_3948value_dense_layer_3950*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_Value_Dense_Layer_layer_call_and_return_conditional_losses_2793�
$Policy_Flatten_Layer/PartitionedCallPartitionedCall=Policy_Batch_Normalization_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *W
fRRP
N__inference_Policy_Flatten_Layer_layer_call_and_return_conditional_losses_2805�
3Value_Batch_Normalization_2/StatefulPartitionedCallStatefulPartitionedCall2Value_Dense_Layer/StatefulPartitionedCall:output:0 value_batch_normalization_2_3954 value_batch_normalization_2_3956 value_batch_normalization_2_3958 value_batch_normalization_2_3960*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *^
fYRW
U__inference_Value_Batch_Normalization_2_layer_call_and_return_conditional_losses_2240�
#Policy_Head/StatefulPartitionedCallStatefulPartitionedCall-Policy_Flatten_Layer/PartitionedCall:output:0policy_head_3963policy_head_3965*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *N
fIRG
E__inference_Policy_Head_layer_call_and_return_conditional_losses_2839�
"Value_Head/StatefulPartitionedCallStatefulPartitionedCall<Value_Batch_Normalization_2/StatefulPartitionedCall:output:0value_head_3968value_head_3970*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_Value_Head_layer_call_and_return_conditional_losses_2868�
>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_0_3821*'
_output_shapes
:�*
dtype0�
/Convolutional_Layer_0/kernel/Regularizer/SquareSquareFConvolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*'
_output_shapes
:��
.Convolutional_Layer_0/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_0/kernel/Regularizer/SumSum3Convolutional_Layer_0/kernel/Regularizer/Square:y:07Convolutional_Layer_0/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_0/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_0/kernel/Regularizer/mulMul7Convolutional_Layer_0/kernel/Regularizer/mul/x:output:05Convolutional_Layer_0/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_0_3823*
_output_shapes
:*
dtype0�
-Convolutional_Layer_0/bias/Regularizer/SquareSquareDConvolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_0/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_0/bias/Regularizer/SumSum1Convolutional_Layer_0/bias/Regularizer/Square:y:05Convolutional_Layer_0/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_0/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_0/bias/Regularizer/mulMul5Convolutional_Layer_0/bias/Regularizer/mul/x:output:03Convolutional_Layer_0/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_1_3835*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_1/kernel/Regularizer/SquareSquareFConvolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_1/kernel/Regularizer/SumSum3Convolutional_Layer_1/kernel/Regularizer/Square:y:07Convolutional_Layer_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_1/kernel/Regularizer/mulMul7Convolutional_Layer_1/kernel/Regularizer/mul/x:output:05Convolutional_Layer_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_1_3837*
_output_shapes
:*
dtype0�
-Convolutional_Layer_1/bias/Regularizer/SquareSquareDConvolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_1/bias/Regularizer/SumSum1Convolutional_Layer_1/bias/Regularizer/Square:y:05Convolutional_Layer_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_1/bias/Regularizer/mulMul5Convolutional_Layer_1/bias/Regularizer/mul/x:output:03Convolutional_Layer_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_2_3849*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_2/kernel/Regularizer/SquareSquareFConvolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_2/kernel/Regularizer/SumSum3Convolutional_Layer_2/kernel/Regularizer/Square:y:07Convolutional_Layer_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_2/kernel/Regularizer/mulMul7Convolutional_Layer_2/kernel/Regularizer/mul/x:output:05Convolutional_Layer_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_2_3851*
_output_shapes
:*
dtype0�
-Convolutional_Layer_2/bias/Regularizer/SquareSquareDConvolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_2/bias/Regularizer/SumSum1Convolutional_Layer_2/bias/Regularizer/Square:y:05Convolutional_Layer_2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_2/bias/Regularizer/mulMul5Convolutional_Layer_2/bias/Regularizer/mul/x:output:03Convolutional_Layer_2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_3_3863*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_3/kernel/Regularizer/SquareSquareFConvolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_3/kernel/Regularizer/SumSum3Convolutional_Layer_3/kernel/Regularizer/Square:y:07Convolutional_Layer_3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_3/kernel/Regularizer/mulMul7Convolutional_Layer_3/kernel/Regularizer/mul/x:output:05Convolutional_Layer_3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_3_3865*
_output_shapes
:*
dtype0�
-Convolutional_Layer_3/bias/Regularizer/SquareSquareDConvolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_3/bias/Regularizer/SumSum1Convolutional_Layer_3/bias/Regularizer/Square:y:05Convolutional_Layer_3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_3/bias/Regularizer/mulMul5Convolutional_Layer_3/bias/Regularizer/mul/x:output:03Convolutional_Layer_3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_4_3877*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_4/kernel/Regularizer/SquareSquareFConvolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_4/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_4/kernel/Regularizer/SumSum3Convolutional_Layer_4/kernel/Regularizer/Square:y:07Convolutional_Layer_4/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_4/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_4/kernel/Regularizer/mulMul7Convolutional_Layer_4/kernel/Regularizer/mul/x:output:05Convolutional_Layer_4/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_4_3879*
_output_shapes
:*
dtype0�
-Convolutional_Layer_4/bias/Regularizer/SquareSquareDConvolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_4/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_4/bias/Regularizer/SumSum1Convolutional_Layer_4/bias/Regularizer/Square:y:05Convolutional_Layer_4/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_4/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_4/bias/Regularizer/mulMul5Convolutional_Layer_4/bias/Regularizer/mul/x:output:03Convolutional_Layer_4/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_5_3891*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_5/kernel/Regularizer/SquareSquareFConvolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_5/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_5/kernel/Regularizer/SumSum3Convolutional_Layer_5/kernel/Regularizer/Square:y:07Convolutional_Layer_5/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_5/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_5/kernel/Regularizer/mulMul7Convolutional_Layer_5/kernel/Regularizer/mul/x:output:05Convolutional_Layer_5/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_5_3893*
_output_shapes
:*
dtype0�
-Convolutional_Layer_5/bias/Regularizer/SquareSquareDConvolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_5/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_5/bias/Regularizer/SumSum1Convolutional_Layer_5/bias/Regularizer/Square:y:05Convolutional_Layer_5/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_5/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_5/bias/Regularizer/mulMul5Convolutional_Layer_5/bias/Regularizer/mul/x:output:03Convolutional_Layer_5/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOpReadVariableOpvalue_convolutional_layer_3910*&
_output_shapes
:*
dtype0�
3Value_Convolutional_Layer/kernel/Regularizer/SquareSquareJValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
2Value_Convolutional_Layer/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
0Value_Convolutional_Layer/kernel/Regularizer/SumSum7Value_Convolutional_Layer/kernel/Regularizer/Square:y:0;Value_Convolutional_Layer/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: w
2Value_Convolutional_Layer/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
0Value_Convolutional_Layer/kernel/Regularizer/mulMul;Value_Convolutional_Layer/kernel/Regularizer/mul/x:output:09Value_Convolutional_Layer/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOpReadVariableOpvalue_convolutional_layer_3912*
_output_shapes
:*
dtype0�
1Value_Convolutional_Layer/bias/Regularizer/SquareSquareHValue_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:z
0Value_Convolutional_Layer/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
.Value_Convolutional_Layer/bias/Regularizer/SumSum5Value_Convolutional_Layer/bias/Regularizer/Square:y:09Value_Convolutional_Layer/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: u
0Value_Convolutional_Layer/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
.Value_Convolutional_Layer/bias/Regularizer/mulMul9Value_Convolutional_Layer/bias/Regularizer/mul/x:output:07Value_Convolutional_Layer/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp!policy_convolutional_layer_1_3905*&
_output_shapes
:*
dtype0�
6Policy_Convolutional_Layer_1/kernel/Regularizer/SquareSquareMPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
5Policy_Convolutional_Layer_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3Policy_Convolutional_Layer_1/kernel/Regularizer/SumSum:Policy_Convolutional_Layer_1/kernel/Regularizer/Square:y:0>Policy_Convolutional_Layer_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5Policy_Convolutional_Layer_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
3Policy_Convolutional_Layer_1/kernel/Regularizer/mulMul>Policy_Convolutional_Layer_1/kernel/Regularizer/mul/x:output:0<Policy_Convolutional_Layer_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpReadVariableOp!policy_convolutional_layer_1_3907*
_output_shapes
:*
dtype0�
4Policy_Convolutional_Layer_1/bias/Regularizer/SquareSquareKPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:}
3Policy_Convolutional_Layer_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
1Policy_Convolutional_Layer_1/bias/Regularizer/SumSum8Policy_Convolutional_Layer_1/bias/Regularizer/Square:y:0<Policy_Convolutional_Layer_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: x
3Policy_Convolutional_Layer_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
1Policy_Convolutional_Layer_1/bias/Regularizer/mulMul<Policy_Convolutional_Layer_1/bias/Regularizer/mul/x:output:0:Policy_Convolutional_Layer_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp!policy_convolutional_layer_2_3933*&
_output_shapes
:*
dtype0�
6Policy_Convolutional_Layer_2/kernel/Regularizer/SquareSquareMPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
5Policy_Convolutional_Layer_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3Policy_Convolutional_Layer_2/kernel/Regularizer/SumSum:Policy_Convolutional_Layer_2/kernel/Regularizer/Square:y:0>Policy_Convolutional_Layer_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5Policy_Convolutional_Layer_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
3Policy_Convolutional_Layer_2/kernel/Regularizer/mulMul>Policy_Convolutional_Layer_2/kernel/Regularizer/mul/x:output:0<Policy_Convolutional_Layer_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpReadVariableOp!policy_convolutional_layer_2_3935*
_output_shapes
:*
dtype0�
4Policy_Convolutional_Layer_2/bias/Regularizer/SquareSquareKPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:}
3Policy_Convolutional_Layer_2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
1Policy_Convolutional_Layer_2/bias/Regularizer/SumSum8Policy_Convolutional_Layer_2/bias/Regularizer/Square:y:0<Policy_Convolutional_Layer_2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: x
3Policy_Convolutional_Layer_2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
1Policy_Convolutional_Layer_2/bias/Regularizer/mulMul<Policy_Convolutional_Layer_2/bias/Regularizer/mul/x:output:0:Policy_Convolutional_Layer_2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOpReadVariableOpvalue_dense_layer_3948*
_output_shapes

:?@*
dtype0�
+Value_Dense_Layer/kernel/Regularizer/SquareSquareBValue_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:?@{
*Value_Dense_Layer/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
(Value_Dense_Layer/kernel/Regularizer/SumSum/Value_Dense_Layer/kernel/Regularizer/Square:y:03Value_Dense_Layer/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: o
*Value_Dense_Layer/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
(Value_Dense_Layer/kernel/Regularizer/mulMul3Value_Dense_Layer/kernel/Regularizer/mul/x:output:01Value_Dense_Layer/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOpReadVariableOpvalue_dense_layer_3950*
_output_shapes
:@*
dtype0�
)Value_Dense_Layer/bias/Regularizer/SquareSquare@Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:@r
(Value_Dense_Layer/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
&Value_Dense_Layer/bias/Regularizer/SumSum-Value_Dense_Layer/bias/Regularizer/Square:y:01Value_Dense_Layer/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: m
(Value_Dense_Layer/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
&Value_Dense_Layer/bias/Regularizer/mulMul1Value_Dense_Layer/bias/Regularizer/mul/x:output:0/Value_Dense_Layer/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
3Value_Head/kernel/Regularizer/Square/ReadVariableOpReadVariableOpvalue_head_3968*
_output_shapes

:@*
dtype0�
$Value_Head/kernel/Regularizer/SquareSquare;Value_Head/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@t
#Value_Head/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
!Value_Head/kernel/Regularizer/SumSum(Value_Head/kernel/Regularizer/Square:y:0,Value_Head/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: h
#Value_Head/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
!Value_Head/kernel/Regularizer/mulMul,Value_Head/kernel/Regularizer/mul/x:output:0*Value_Head/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: }
1Value_Head/bias/Regularizer/Square/ReadVariableOpReadVariableOpvalue_head_3970*
_output_shapes
:*
dtype0�
"Value_Head/bias/Regularizer/SquareSquare9Value_Head/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:k
!Value_Head/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
Value_Head/bias/Regularizer/SumSum&Value_Head/bias/Regularizer/Square:y:0*Value_Head/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: f
!Value_Head/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
Value_Head/bias/Regularizer/mulMul*Value_Head/bias/Regularizer/mul/x:output:0(Value_Head/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
4Policy_Head/kernel/Regularizer/Square/ReadVariableOpReadVariableOppolicy_head_3963*
_output_shapes
:	?�*
dtype0�
%Policy_Head/kernel/Regularizer/SquareSquare<Policy_Head/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?�u
$Policy_Head/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
"Policy_Head/kernel/Regularizer/SumSum)Policy_Head/kernel/Regularizer/Square:y:0-Policy_Head/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$Policy_Head/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
"Policy_Head/kernel/Regularizer/mulMul-Policy_Head/kernel/Regularizer/mul/x:output:0+Policy_Head/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
2Policy_Head/bias/Regularizer/Square/ReadVariableOpReadVariableOppolicy_head_3965*
_output_shapes	
:�*
dtype0�
#Policy_Head/bias/Regularizer/SquareSquare:Policy_Head/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes	
:�l
"Policy_Head/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
 Policy_Head/bias/Regularizer/SumSum'Policy_Head/bias/Regularizer/Square:y:0+Policy_Head/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: g
"Policy_Head/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
 Policy_Head/bias/Regularizer/mulMul+Policy_Head/bias/Regularizer/mul/x:output:0)Policy_Head/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: z
IdentityIdentity+Value_Head/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������~

Identity_1Identity,Policy_Head/StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:�����������
NoOpNoOp.^Batch_Normalization_0/StatefulPartitionedCall.^Batch_Normalization_1/StatefulPartitionedCall.^Batch_Normalization_2/StatefulPartitionedCall.^Batch_Normalization_3/StatefulPartitionedCall.^Batch_Normalization_4/StatefulPartitionedCall.^Batch_Normalization_5/StatefulPartitionedCall.^Convolutional_Layer_0/StatefulPartitionedCall=^Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp.^Convolutional_Layer_1/StatefulPartitionedCall=^Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp.^Convolutional_Layer_2/StatefulPartitionedCall=^Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp.^Convolutional_Layer_3/StatefulPartitionedCall=^Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp.^Convolutional_Layer_4/StatefulPartitionedCall=^Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp.^Convolutional_Layer_5/StatefulPartitionedCall=^Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp5^Policy_Batch_Normalization_1/StatefulPartitionedCall5^Policy_Batch_Normalization_2/StatefulPartitionedCall5^Policy_Convolutional_Layer_1/StatefulPartitionedCallD^Policy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpF^Policy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp5^Policy_Convolutional_Layer_2/StatefulPartitionedCallD^Policy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpF^Policy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp$^Policy_Head/StatefulPartitionedCall3^Policy_Head/bias/Regularizer/Square/ReadVariableOp5^Policy_Head/kernel/Regularizer/Square/ReadVariableOp4^Value_Batch_Normalization_1/StatefulPartitionedCall4^Value_Batch_Normalization_2/StatefulPartitionedCall2^Value_Convolutional_Layer/StatefulPartitionedCallA^Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOpC^Value_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp*^Value_Dense_Layer/StatefulPartitionedCall9^Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp;^Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp#^Value_Head/StatefulPartitionedCall2^Value_Head/bias/Regularizer/Square/ReadVariableOp4^Value_Head/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������	�: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2^
-Batch_Normalization_0/StatefulPartitionedCall-Batch_Normalization_0/StatefulPartitionedCall2^
-Batch_Normalization_1/StatefulPartitionedCall-Batch_Normalization_1/StatefulPartitionedCall2^
-Batch_Normalization_2/StatefulPartitionedCall-Batch_Normalization_2/StatefulPartitionedCall2^
-Batch_Normalization_3/StatefulPartitionedCall-Batch_Normalization_3/StatefulPartitionedCall2^
-Batch_Normalization_4/StatefulPartitionedCall-Batch_Normalization_4/StatefulPartitionedCall2^
-Batch_Normalization_5/StatefulPartitionedCall-Batch_Normalization_5/StatefulPartitionedCall2^
-Convolutional_Layer_0/StatefulPartitionedCall-Convolutional_Layer_0/StatefulPartitionedCall2|
<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp2^
-Convolutional_Layer_1/StatefulPartitionedCall-Convolutional_Layer_1/StatefulPartitionedCall2|
<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp2^
-Convolutional_Layer_2/StatefulPartitionedCall-Convolutional_Layer_2/StatefulPartitionedCall2|
<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp2^
-Convolutional_Layer_3/StatefulPartitionedCall-Convolutional_Layer_3/StatefulPartitionedCall2|
<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp2^
-Convolutional_Layer_4/StatefulPartitionedCall-Convolutional_Layer_4/StatefulPartitionedCall2|
<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp2^
-Convolutional_Layer_5/StatefulPartitionedCall-Convolutional_Layer_5/StatefulPartitionedCall2|
<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp2l
4Policy_Batch_Normalization_1/StatefulPartitionedCall4Policy_Batch_Normalization_1/StatefulPartitionedCall2l
4Policy_Batch_Normalization_2/StatefulPartitionedCall4Policy_Batch_Normalization_2/StatefulPartitionedCall2l
4Policy_Convolutional_Layer_1/StatefulPartitionedCall4Policy_Convolutional_Layer_1/StatefulPartitionedCall2�
CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpCPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp2�
EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpEPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp2l
4Policy_Convolutional_Layer_2/StatefulPartitionedCall4Policy_Convolutional_Layer_2/StatefulPartitionedCall2�
CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpCPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp2�
EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpEPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp2J
#Policy_Head/StatefulPartitionedCall#Policy_Head/StatefulPartitionedCall2h
2Policy_Head/bias/Regularizer/Square/ReadVariableOp2Policy_Head/bias/Regularizer/Square/ReadVariableOp2l
4Policy_Head/kernel/Regularizer/Square/ReadVariableOp4Policy_Head/kernel/Regularizer/Square/ReadVariableOp2j
3Value_Batch_Normalization_1/StatefulPartitionedCall3Value_Batch_Normalization_1/StatefulPartitionedCall2j
3Value_Batch_Normalization_2/StatefulPartitionedCall3Value_Batch_Normalization_2/StatefulPartitionedCall2f
1Value_Convolutional_Layer/StatefulPartitionedCall1Value_Convolutional_Layer/StatefulPartitionedCall2�
@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp2�
BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOpBValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp2V
)Value_Dense_Layer/StatefulPartitionedCall)Value_Dense_Layer/StatefulPartitionedCall2t
8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp2x
:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp2H
"Value_Head/StatefulPartitionedCall"Value_Head/StatefulPartitionedCall2f
1Value_Head/bias/Regularizer/Square/ReadVariableOp1Value_Head/bias/Regularizer/Square/ReadVariableOp2j
3Value_Head/kernel/Regularizer/Square/ReadVariableOp3Value_Head/kernel/Regularizer/Square/ReadVariableOp:X T
0
_output_shapes
:���������	�
 
_user_specified_nameinputs
�
�
__inference_loss_fn_12_8201e
Kvalue_convolutional_layer_kernel_regularizer_square_readvariableop_resource:
identity��BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp�
BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOpReadVariableOpKvalue_convolutional_layer_kernel_regularizer_square_readvariableop_resource*&
_output_shapes
:*
dtype0�
3Value_Convolutional_Layer/kernel/Regularizer/SquareSquareJValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
2Value_Convolutional_Layer/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
0Value_Convolutional_Layer/kernel/Regularizer/SumSum7Value_Convolutional_Layer/kernel/Regularizer/Square:y:0;Value_Convolutional_Layer/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: w
2Value_Convolutional_Layer/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
0Value_Convolutional_Layer/kernel/Regularizer/mulMul;Value_Convolutional_Layer/kernel/Regularizer/mul/x:output:09Value_Convolutional_Layer/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: r
IdentityIdentity4Value_Convolutional_Layer/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOpC^Value_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2�
BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOpBValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp
݈
�P
A__inference_model_1_layer_call_and_return_conditional_losses_6312

inputsO
4convolutional_layer_0_conv2d_readvariableop_resource:�C
5convolutional_layer_0_biasadd_readvariableop_resource:;
-batch_normalization_0_readvariableop_resource:=
/batch_normalization_0_readvariableop_1_resource:L
>batch_normalization_0_fusedbatchnormv3_readvariableop_resource:N
@batch_normalization_0_fusedbatchnormv3_readvariableop_1_resource:N
4convolutional_layer_1_conv2d_readvariableop_resource:C
5convolutional_layer_1_biasadd_readvariableop_resource:;
-batch_normalization_1_readvariableop_resource:=
/batch_normalization_1_readvariableop_1_resource:L
>batch_normalization_1_fusedbatchnormv3_readvariableop_resource:N
@batch_normalization_1_fusedbatchnormv3_readvariableop_1_resource:N
4convolutional_layer_2_conv2d_readvariableop_resource:C
5convolutional_layer_2_biasadd_readvariableop_resource:;
-batch_normalization_2_readvariableop_resource:=
/batch_normalization_2_readvariableop_1_resource:L
>batch_normalization_2_fusedbatchnormv3_readvariableop_resource:N
@batch_normalization_2_fusedbatchnormv3_readvariableop_1_resource:N
4convolutional_layer_3_conv2d_readvariableop_resource:C
5convolutional_layer_3_biasadd_readvariableop_resource:;
-batch_normalization_3_readvariableop_resource:=
/batch_normalization_3_readvariableop_1_resource:L
>batch_normalization_3_fusedbatchnormv3_readvariableop_resource:N
@batch_normalization_3_fusedbatchnormv3_readvariableop_1_resource:N
4convolutional_layer_4_conv2d_readvariableop_resource:C
5convolutional_layer_4_biasadd_readvariableop_resource:;
-batch_normalization_4_readvariableop_resource:=
/batch_normalization_4_readvariableop_1_resource:L
>batch_normalization_4_fusedbatchnormv3_readvariableop_resource:N
@batch_normalization_4_fusedbatchnormv3_readvariableop_1_resource:N
4convolutional_layer_5_conv2d_readvariableop_resource:C
5convolutional_layer_5_biasadd_readvariableop_resource:;
-batch_normalization_5_readvariableop_resource:=
/batch_normalization_5_readvariableop_1_resource:L
>batch_normalization_5_fusedbatchnormv3_readvariableop_resource:N
@batch_normalization_5_fusedbatchnormv3_readvariableop_1_resource:U
;policy_convolutional_layer_1_conv2d_readvariableop_resource:J
<policy_convolutional_layer_1_biasadd_readvariableop_resource:R
8value_convolutional_layer_conv2d_readvariableop_resource:G
9value_convolutional_layer_biasadd_readvariableop_resource:B
4policy_batch_normalization_1_readvariableop_resource:D
6policy_batch_normalization_1_readvariableop_1_resource:S
Epolicy_batch_normalization_1_fusedbatchnormv3_readvariableop_resource:U
Gpolicy_batch_normalization_1_fusedbatchnormv3_readvariableop_1_resource:A
3value_batch_normalization_1_readvariableop_resource:C
5value_batch_normalization_1_readvariableop_1_resource:R
Dvalue_batch_normalization_1_fusedbatchnormv3_readvariableop_resource:T
Fvalue_batch_normalization_1_fusedbatchnormv3_readvariableop_1_resource:U
;policy_convolutional_layer_2_conv2d_readvariableop_resource:J
<policy_convolutional_layer_2_biasadd_readvariableop_resource:B
4policy_batch_normalization_2_readvariableop_resource:D
6policy_batch_normalization_2_readvariableop_1_resource:S
Epolicy_batch_normalization_2_fusedbatchnormv3_readvariableop_resource:U
Gpolicy_batch_normalization_2_fusedbatchnormv3_readvariableop_1_resource:B
0value_dense_layer_matmul_readvariableop_resource:?@?
1value_dense_layer_biasadd_readvariableop_resource:@Q
Cvalue_batch_normalization_2_assignmovingavg_readvariableop_resource:@S
Evalue_batch_normalization_2_assignmovingavg_1_readvariableop_resource:@O
Avalue_batch_normalization_2_batchnorm_mul_readvariableop_resource:@K
=value_batch_normalization_2_batchnorm_readvariableop_resource:@=
*policy_head_matmul_readvariableop_resource:	?�:
+policy_head_biasadd_readvariableop_resource:	�;
)value_head_matmul_readvariableop_resource:@8
*value_head_biasadd_readvariableop_resource:
identity

identity_1��$Batch_Normalization_0/AssignNewValue�&Batch_Normalization_0/AssignNewValue_1�5Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp�7Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp_1�$Batch_Normalization_0/ReadVariableOp�&Batch_Normalization_0/ReadVariableOp_1�$Batch_Normalization_1/AssignNewValue�&Batch_Normalization_1/AssignNewValue_1�5Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp�7Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1�$Batch_Normalization_1/ReadVariableOp�&Batch_Normalization_1/ReadVariableOp_1�$Batch_Normalization_2/AssignNewValue�&Batch_Normalization_2/AssignNewValue_1�5Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp�7Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1�$Batch_Normalization_2/ReadVariableOp�&Batch_Normalization_2/ReadVariableOp_1�$Batch_Normalization_3/AssignNewValue�&Batch_Normalization_3/AssignNewValue_1�5Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp�7Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp_1�$Batch_Normalization_3/ReadVariableOp�&Batch_Normalization_3/ReadVariableOp_1�$Batch_Normalization_4/AssignNewValue�&Batch_Normalization_4/AssignNewValue_1�5Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp�7Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp_1�$Batch_Normalization_4/ReadVariableOp�&Batch_Normalization_4/ReadVariableOp_1�$Batch_Normalization_5/AssignNewValue�&Batch_Normalization_5/AssignNewValue_1�5Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp�7Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp_1�$Batch_Normalization_5/ReadVariableOp�&Batch_Normalization_5/ReadVariableOp_1�,Convolutional_Layer_0/BiasAdd/ReadVariableOp�+Convolutional_Layer_0/Conv2D/ReadVariableOp�<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp�,Convolutional_Layer_1/BiasAdd/ReadVariableOp�+Convolutional_Layer_1/Conv2D/ReadVariableOp�<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp�,Convolutional_Layer_2/BiasAdd/ReadVariableOp�+Convolutional_Layer_2/Conv2D/ReadVariableOp�<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp�,Convolutional_Layer_3/BiasAdd/ReadVariableOp�+Convolutional_Layer_3/Conv2D/ReadVariableOp�<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp�,Convolutional_Layer_4/BiasAdd/ReadVariableOp�+Convolutional_Layer_4/Conv2D/ReadVariableOp�<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp�,Convolutional_Layer_5/BiasAdd/ReadVariableOp�+Convolutional_Layer_5/Conv2D/ReadVariableOp�<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp�+Policy_Batch_Normalization_1/AssignNewValue�-Policy_Batch_Normalization_1/AssignNewValue_1�<Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp�>Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1�+Policy_Batch_Normalization_1/ReadVariableOp�-Policy_Batch_Normalization_1/ReadVariableOp_1�+Policy_Batch_Normalization_2/AssignNewValue�-Policy_Batch_Normalization_2/AssignNewValue_1�<Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp�>Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1�+Policy_Batch_Normalization_2/ReadVariableOp�-Policy_Batch_Normalization_2/ReadVariableOp_1�3Policy_Convolutional_Layer_1/BiasAdd/ReadVariableOp�2Policy_Convolutional_Layer_1/Conv2D/ReadVariableOp�CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp�EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp�3Policy_Convolutional_Layer_2/BiasAdd/ReadVariableOp�2Policy_Convolutional_Layer_2/Conv2D/ReadVariableOp�CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp�EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp�"Policy_Head/BiasAdd/ReadVariableOp�!Policy_Head/MatMul/ReadVariableOp�2Policy_Head/bias/Regularizer/Square/ReadVariableOp�4Policy_Head/kernel/Regularizer/Square/ReadVariableOp�*Value_Batch_Normalization_1/AssignNewValue�,Value_Batch_Normalization_1/AssignNewValue_1�;Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp�=Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1�*Value_Batch_Normalization_1/ReadVariableOp�,Value_Batch_Normalization_1/ReadVariableOp_1�+Value_Batch_Normalization_2/AssignMovingAvg�:Value_Batch_Normalization_2/AssignMovingAvg/ReadVariableOp�-Value_Batch_Normalization_2/AssignMovingAvg_1�<Value_Batch_Normalization_2/AssignMovingAvg_1/ReadVariableOp�4Value_Batch_Normalization_2/batchnorm/ReadVariableOp�8Value_Batch_Normalization_2/batchnorm/mul/ReadVariableOp�0Value_Convolutional_Layer/BiasAdd/ReadVariableOp�/Value_Convolutional_Layer/Conv2D/ReadVariableOp�@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp�BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp�(Value_Dense_Layer/BiasAdd/ReadVariableOp�'Value_Dense_Layer/MatMul/ReadVariableOp�8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp�:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp�!Value_Head/BiasAdd/ReadVariableOp� Value_Head/MatMul/ReadVariableOp�1Value_Head/bias/Regularizer/Square/ReadVariableOp�3Value_Head/kernel/Regularizer/Square/ReadVariableOp�
+Convolutional_Layer_0/Conv2D/ReadVariableOpReadVariableOp4convolutional_layer_0_conv2d_readvariableop_resource*'
_output_shapes
:�*
dtype0�
Convolutional_Layer_0/Conv2DConv2Dinputs3Convolutional_Layer_0/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
,Convolutional_Layer_0/BiasAdd/ReadVariableOpReadVariableOp5convolutional_layer_0_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
Convolutional_Layer_0/BiasAddBiasAdd%Convolutional_Layer_0/Conv2D:output:04Convolutional_Layer_0/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
Convolutional_Layer_0/ReluRelu&Convolutional_Layer_0/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
$Batch_Normalization_0/ReadVariableOpReadVariableOp-batch_normalization_0_readvariableop_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_0/ReadVariableOp_1ReadVariableOp/batch_normalization_0_readvariableop_1_resource*
_output_shapes
:*
dtype0�
5Batch_Normalization_0/FusedBatchNormV3/ReadVariableOpReadVariableOp>batch_normalization_0_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
7Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp@batch_normalization_0_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_0/FusedBatchNormV3FusedBatchNormV3(Convolutional_Layer_0/Relu:activations:0,Batch_Normalization_0/ReadVariableOp:value:0.Batch_Normalization_0/ReadVariableOp_1:value:0=Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp:value:0?Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
$Batch_Normalization_0/AssignNewValueAssignVariableOp>batch_normalization_0_fusedbatchnormv3_readvariableop_resource3Batch_Normalization_0/FusedBatchNormV3:batch_mean:06^Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
&Batch_Normalization_0/AssignNewValue_1AssignVariableOp@batch_normalization_0_fusedbatchnormv3_readvariableop_1_resource7Batch_Normalization_0/FusedBatchNormV3:batch_variance:08^Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0�
+Convolutional_Layer_1/Conv2D/ReadVariableOpReadVariableOp4convolutional_layer_1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Convolutional_Layer_1/Conv2DConv2D*Batch_Normalization_0/FusedBatchNormV3:y:03Convolutional_Layer_1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
,Convolutional_Layer_1/BiasAdd/ReadVariableOpReadVariableOp5convolutional_layer_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
Convolutional_Layer_1/BiasAddBiasAdd%Convolutional_Layer_1/Conv2D:output:04Convolutional_Layer_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
Convolutional_Layer_1/ReluRelu&Convolutional_Layer_1/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
$Batch_Normalization_1/ReadVariableOpReadVariableOp-batch_normalization_1_readvariableop_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_1/ReadVariableOp_1ReadVariableOp/batch_normalization_1_readvariableop_1_resource*
_output_shapes
:*
dtype0�
5Batch_Normalization_1/FusedBatchNormV3/ReadVariableOpReadVariableOp>batch_normalization_1_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
7Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp@batch_normalization_1_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_1/FusedBatchNormV3FusedBatchNormV3(Convolutional_Layer_1/Relu:activations:0,Batch_Normalization_1/ReadVariableOp:value:0.Batch_Normalization_1/ReadVariableOp_1:value:0=Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp:value:0?Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
$Batch_Normalization_1/AssignNewValueAssignVariableOp>batch_normalization_1_fusedbatchnormv3_readvariableop_resource3Batch_Normalization_1/FusedBatchNormV3:batch_mean:06^Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
&Batch_Normalization_1/AssignNewValue_1AssignVariableOp@batch_normalization_1_fusedbatchnormv3_readvariableop_1_resource7Batch_Normalization_1/FusedBatchNormV3:batch_variance:08^Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0�
+Convolutional_Layer_2/Conv2D/ReadVariableOpReadVariableOp4convolutional_layer_2_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Convolutional_Layer_2/Conv2DConv2D*Batch_Normalization_1/FusedBatchNormV3:y:03Convolutional_Layer_2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
,Convolutional_Layer_2/BiasAdd/ReadVariableOpReadVariableOp5convolutional_layer_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
Convolutional_Layer_2/BiasAddBiasAdd%Convolutional_Layer_2/Conv2D:output:04Convolutional_Layer_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
Convolutional_Layer_2/ReluRelu&Convolutional_Layer_2/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
$Batch_Normalization_2/ReadVariableOpReadVariableOp-batch_normalization_2_readvariableop_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_2/ReadVariableOp_1ReadVariableOp/batch_normalization_2_readvariableop_1_resource*
_output_shapes
:*
dtype0�
5Batch_Normalization_2/FusedBatchNormV3/ReadVariableOpReadVariableOp>batch_normalization_2_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
7Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp@batch_normalization_2_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_2/FusedBatchNormV3FusedBatchNormV3(Convolutional_Layer_2/Relu:activations:0,Batch_Normalization_2/ReadVariableOp:value:0.Batch_Normalization_2/ReadVariableOp_1:value:0=Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp:value:0?Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
$Batch_Normalization_2/AssignNewValueAssignVariableOp>batch_normalization_2_fusedbatchnormv3_readvariableop_resource3Batch_Normalization_2/FusedBatchNormV3:batch_mean:06^Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
&Batch_Normalization_2/AssignNewValue_1AssignVariableOp@batch_normalization_2_fusedbatchnormv3_readvariableop_1_resource7Batch_Normalization_2/FusedBatchNormV3:batch_variance:08^Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0�
+Convolutional_Layer_3/Conv2D/ReadVariableOpReadVariableOp4convolutional_layer_3_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Convolutional_Layer_3/Conv2DConv2D*Batch_Normalization_2/FusedBatchNormV3:y:03Convolutional_Layer_3/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
,Convolutional_Layer_3/BiasAdd/ReadVariableOpReadVariableOp5convolutional_layer_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
Convolutional_Layer_3/BiasAddBiasAdd%Convolutional_Layer_3/Conv2D:output:04Convolutional_Layer_3/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
Convolutional_Layer_3/ReluRelu&Convolutional_Layer_3/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
$Batch_Normalization_3/ReadVariableOpReadVariableOp-batch_normalization_3_readvariableop_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_3/ReadVariableOp_1ReadVariableOp/batch_normalization_3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
5Batch_Normalization_3/FusedBatchNormV3/ReadVariableOpReadVariableOp>batch_normalization_3_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
7Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp@batch_normalization_3_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_3/FusedBatchNormV3FusedBatchNormV3(Convolutional_Layer_3/Relu:activations:0,Batch_Normalization_3/ReadVariableOp:value:0.Batch_Normalization_3/ReadVariableOp_1:value:0=Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp:value:0?Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
$Batch_Normalization_3/AssignNewValueAssignVariableOp>batch_normalization_3_fusedbatchnormv3_readvariableop_resource3Batch_Normalization_3/FusedBatchNormV3:batch_mean:06^Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
&Batch_Normalization_3/AssignNewValue_1AssignVariableOp@batch_normalization_3_fusedbatchnormv3_readvariableop_1_resource7Batch_Normalization_3/FusedBatchNormV3:batch_variance:08^Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0�
+Convolutional_Layer_4/Conv2D/ReadVariableOpReadVariableOp4convolutional_layer_4_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Convolutional_Layer_4/Conv2DConv2D*Batch_Normalization_3/FusedBatchNormV3:y:03Convolutional_Layer_4/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
,Convolutional_Layer_4/BiasAdd/ReadVariableOpReadVariableOp5convolutional_layer_4_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
Convolutional_Layer_4/BiasAddBiasAdd%Convolutional_Layer_4/Conv2D:output:04Convolutional_Layer_4/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
Convolutional_Layer_4/ReluRelu&Convolutional_Layer_4/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
$Batch_Normalization_4/ReadVariableOpReadVariableOp-batch_normalization_4_readvariableop_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_4/ReadVariableOp_1ReadVariableOp/batch_normalization_4_readvariableop_1_resource*
_output_shapes
:*
dtype0�
5Batch_Normalization_4/FusedBatchNormV3/ReadVariableOpReadVariableOp>batch_normalization_4_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
7Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp@batch_normalization_4_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_4/FusedBatchNormV3FusedBatchNormV3(Convolutional_Layer_4/Relu:activations:0,Batch_Normalization_4/ReadVariableOp:value:0.Batch_Normalization_4/ReadVariableOp_1:value:0=Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp:value:0?Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
$Batch_Normalization_4/AssignNewValueAssignVariableOp>batch_normalization_4_fusedbatchnormv3_readvariableop_resource3Batch_Normalization_4/FusedBatchNormV3:batch_mean:06^Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
&Batch_Normalization_4/AssignNewValue_1AssignVariableOp@batch_normalization_4_fusedbatchnormv3_readvariableop_1_resource7Batch_Normalization_4/FusedBatchNormV3:batch_variance:08^Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0�
+Convolutional_Layer_5/Conv2D/ReadVariableOpReadVariableOp4convolutional_layer_5_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Convolutional_Layer_5/Conv2DConv2D*Batch_Normalization_4/FusedBatchNormV3:y:03Convolutional_Layer_5/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
,Convolutional_Layer_5/BiasAdd/ReadVariableOpReadVariableOp5convolutional_layer_5_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
Convolutional_Layer_5/BiasAddBiasAdd%Convolutional_Layer_5/Conv2D:output:04Convolutional_Layer_5/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
Convolutional_Layer_5/ReluRelu&Convolutional_Layer_5/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
$Batch_Normalization_5/ReadVariableOpReadVariableOp-batch_normalization_5_readvariableop_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_5/ReadVariableOp_1ReadVariableOp/batch_normalization_5_readvariableop_1_resource*
_output_shapes
:*
dtype0�
5Batch_Normalization_5/FusedBatchNormV3/ReadVariableOpReadVariableOp>batch_normalization_5_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
7Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp@batch_normalization_5_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
&Batch_Normalization_5/FusedBatchNormV3FusedBatchNormV3(Convolutional_Layer_5/Relu:activations:0,Batch_Normalization_5/ReadVariableOp:value:0.Batch_Normalization_5/ReadVariableOp_1:value:0=Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp:value:0?Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
$Batch_Normalization_5/AssignNewValueAssignVariableOp>batch_normalization_5_fusedbatchnormv3_readvariableop_resource3Batch_Normalization_5/FusedBatchNormV3:batch_mean:06^Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
&Batch_Normalization_5/AssignNewValue_1AssignVariableOp@batch_normalization_5_fusedbatchnormv3_readvariableop_1_resource7Batch_Normalization_5/FusedBatchNormV3:batch_variance:08^Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0�
2Policy_Convolutional_Layer_1/Conv2D/ReadVariableOpReadVariableOp;policy_convolutional_layer_1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
#Policy_Convolutional_Layer_1/Conv2DConv2D*Batch_Normalization_5/FusedBatchNormV3:y:0:Policy_Convolutional_Layer_1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
3Policy_Convolutional_Layer_1/BiasAdd/ReadVariableOpReadVariableOp<policy_convolutional_layer_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
$Policy_Convolutional_Layer_1/BiasAddBiasAdd,Policy_Convolutional_Layer_1/Conv2D:output:0;Policy_Convolutional_Layer_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
!Policy_Convolutional_Layer_1/ReluRelu-Policy_Convolutional_Layer_1/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
/Value_Convolutional_Layer/Conv2D/ReadVariableOpReadVariableOp8value_convolutional_layer_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
 Value_Convolutional_Layer/Conv2DConv2D*Batch_Normalization_5/FusedBatchNormV3:y:07Value_Convolutional_Layer/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
0Value_Convolutional_Layer/BiasAdd/ReadVariableOpReadVariableOp9value_convolutional_layer_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
!Value_Convolutional_Layer/BiasAddBiasAdd)Value_Convolutional_Layer/Conv2D:output:08Value_Convolutional_Layer/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
Value_Convolutional_Layer/ReluRelu*Value_Convolutional_Layer/BiasAdd:output:0*
T0*/
_output_shapes
:���������	�
+Policy_Batch_Normalization_1/ReadVariableOpReadVariableOp4policy_batch_normalization_1_readvariableop_resource*
_output_shapes
:*
dtype0�
-Policy_Batch_Normalization_1/ReadVariableOp_1ReadVariableOp6policy_batch_normalization_1_readvariableop_1_resource*
_output_shapes
:*
dtype0�
<Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOpReadVariableOpEpolicy_batch_normalization_1_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
>Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpGpolicy_batch_normalization_1_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
-Policy_Batch_Normalization_1/FusedBatchNormV3FusedBatchNormV3/Policy_Convolutional_Layer_1/Relu:activations:03Policy_Batch_Normalization_1/ReadVariableOp:value:05Policy_Batch_Normalization_1/ReadVariableOp_1:value:0DPolicy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp:value:0FPolicy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
+Policy_Batch_Normalization_1/AssignNewValueAssignVariableOpEpolicy_batch_normalization_1_fusedbatchnormv3_readvariableop_resource:Policy_Batch_Normalization_1/FusedBatchNormV3:batch_mean:0=^Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
-Policy_Batch_Normalization_1/AssignNewValue_1AssignVariableOpGpolicy_batch_normalization_1_fusedbatchnormv3_readvariableop_1_resource>Policy_Batch_Normalization_1/FusedBatchNormV3:batch_variance:0?^Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0�
*Value_Batch_Normalization_1/ReadVariableOpReadVariableOp3value_batch_normalization_1_readvariableop_resource*
_output_shapes
:*
dtype0�
,Value_Batch_Normalization_1/ReadVariableOp_1ReadVariableOp5value_batch_normalization_1_readvariableop_1_resource*
_output_shapes
:*
dtype0�
;Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOpReadVariableOpDvalue_batch_normalization_1_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
=Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpFvalue_batch_normalization_1_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
,Value_Batch_Normalization_1/FusedBatchNormV3FusedBatchNormV3,Value_Convolutional_Layer/Relu:activations:02Value_Batch_Normalization_1/ReadVariableOp:value:04Value_Batch_Normalization_1/ReadVariableOp_1:value:0CValue_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp:value:0EValue_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
*Value_Batch_Normalization_1/AssignNewValueAssignVariableOpDvalue_batch_normalization_1_fusedbatchnormv3_readvariableop_resource9Value_Batch_Normalization_1/FusedBatchNormV3:batch_mean:0<^Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
,Value_Batch_Normalization_1/AssignNewValue_1AssignVariableOpFvalue_batch_normalization_1_fusedbatchnormv3_readvariableop_1_resource=Value_Batch_Normalization_1/FusedBatchNormV3:batch_variance:0>^Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0�
2Policy_Convolutional_Layer_2/Conv2D/ReadVariableOpReadVariableOp;policy_convolutional_layer_2_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
#Policy_Convolutional_Layer_2/Conv2DConv2D1Policy_Batch_Normalization_1/FusedBatchNormV3:y:0:Policy_Convolutional_Layer_2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
3Policy_Convolutional_Layer_2/BiasAdd/ReadVariableOpReadVariableOp<policy_convolutional_layer_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
$Policy_Convolutional_Layer_2/BiasAddBiasAdd,Policy_Convolutional_Layer_2/Conv2D:output:0;Policy_Convolutional_Layer_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
!Policy_Convolutional_Layer_2/ReluRelu-Policy_Convolutional_Layer_2/BiasAdd:output:0*
T0*/
_output_shapes
:���������	j
Value_Flatten_Layer/ConstConst*
_output_shapes
:*
dtype0*
valueB"����?   �
Value_Flatten_Layer/ReshapeReshape0Value_Batch_Normalization_1/FusedBatchNormV3:y:0"Value_Flatten_Layer/Const:output:0*
T0*'
_output_shapes
:���������?�
+Policy_Batch_Normalization_2/ReadVariableOpReadVariableOp4policy_batch_normalization_2_readvariableop_resource*
_output_shapes
:*
dtype0�
-Policy_Batch_Normalization_2/ReadVariableOp_1ReadVariableOp6policy_batch_normalization_2_readvariableop_1_resource*
_output_shapes
:*
dtype0�
<Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOpReadVariableOpEpolicy_batch_normalization_2_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
>Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpGpolicy_batch_normalization_2_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
-Policy_Batch_Normalization_2/FusedBatchNormV3FusedBatchNormV3/Policy_Convolutional_Layer_2/Relu:activations:03Policy_Batch_Normalization_2/ReadVariableOp:value:05Policy_Batch_Normalization_2/ReadVariableOp_1:value:0DPolicy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp:value:0FPolicy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
+Policy_Batch_Normalization_2/AssignNewValueAssignVariableOpEpolicy_batch_normalization_2_fusedbatchnormv3_readvariableop_resource:Policy_Batch_Normalization_2/FusedBatchNormV3:batch_mean:0=^Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
-Policy_Batch_Normalization_2/AssignNewValue_1AssignVariableOpGpolicy_batch_normalization_2_fusedbatchnormv3_readvariableop_1_resource>Policy_Batch_Normalization_2/FusedBatchNormV3:batch_variance:0?^Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0�
'Value_Dense_Layer/MatMul/ReadVariableOpReadVariableOp0value_dense_layer_matmul_readvariableop_resource*
_output_shapes

:?@*
dtype0�
Value_Dense_Layer/MatMulMatMul$Value_Flatten_Layer/Reshape:output:0/Value_Dense_Layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@�
(Value_Dense_Layer/BiasAdd/ReadVariableOpReadVariableOp1value_dense_layer_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
Value_Dense_Layer/BiasAddBiasAdd"Value_Dense_Layer/MatMul:product:00Value_Dense_Layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@t
Value_Dense_Layer/ReluRelu"Value_Dense_Layer/BiasAdd:output:0*
T0*'
_output_shapes
:���������@k
Policy_Flatten_Layer/ConstConst*
_output_shapes
:*
dtype0*
valueB"����?   �
Policy_Flatten_Layer/ReshapeReshape1Policy_Batch_Normalization_2/FusedBatchNormV3:y:0#Policy_Flatten_Layer/Const:output:0*
T0*'
_output_shapes
:���������?�
:Value_Batch_Normalization_2/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: �
(Value_Batch_Normalization_2/moments/meanMean$Value_Dense_Layer/Relu:activations:0CValue_Batch_Normalization_2/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:@*
	keep_dims(�
0Value_Batch_Normalization_2/moments/StopGradientStopGradient1Value_Batch_Normalization_2/moments/mean:output:0*
T0*
_output_shapes

:@�
5Value_Batch_Normalization_2/moments/SquaredDifferenceSquaredDifference$Value_Dense_Layer/Relu:activations:09Value_Batch_Normalization_2/moments/StopGradient:output:0*
T0*'
_output_shapes
:���������@�
>Value_Batch_Normalization_2/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: �
,Value_Batch_Normalization_2/moments/varianceMean9Value_Batch_Normalization_2/moments/SquaredDifference:z:0GValue_Batch_Normalization_2/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:@*
	keep_dims(�
+Value_Batch_Normalization_2/moments/SqueezeSqueeze1Value_Batch_Normalization_2/moments/mean:output:0*
T0*
_output_shapes
:@*
squeeze_dims
 �
-Value_Batch_Normalization_2/moments/Squeeze_1Squeeze5Value_Batch_Normalization_2/moments/variance:output:0*
T0*
_output_shapes
:@*
squeeze_dims
 v
1Value_Batch_Normalization_2/AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
:Value_Batch_Normalization_2/AssignMovingAvg/ReadVariableOpReadVariableOpCvalue_batch_normalization_2_assignmovingavg_readvariableop_resource*
_output_shapes
:@*
dtype0�
/Value_Batch_Normalization_2/AssignMovingAvg/subSubBValue_Batch_Normalization_2/AssignMovingAvg/ReadVariableOp:value:04Value_Batch_Normalization_2/moments/Squeeze:output:0*
T0*
_output_shapes
:@�
/Value_Batch_Normalization_2/AssignMovingAvg/mulMul3Value_Batch_Normalization_2/AssignMovingAvg/sub:z:0:Value_Batch_Normalization_2/AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:@�
+Value_Batch_Normalization_2/AssignMovingAvgAssignSubVariableOpCvalue_batch_normalization_2_assignmovingavg_readvariableop_resource3Value_Batch_Normalization_2/AssignMovingAvg/mul:z:0;^Value_Batch_Normalization_2/AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0x
3Value_Batch_Normalization_2/AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
<Value_Batch_Normalization_2/AssignMovingAvg_1/ReadVariableOpReadVariableOpEvalue_batch_normalization_2_assignmovingavg_1_readvariableop_resource*
_output_shapes
:@*
dtype0�
1Value_Batch_Normalization_2/AssignMovingAvg_1/subSubDValue_Batch_Normalization_2/AssignMovingAvg_1/ReadVariableOp:value:06Value_Batch_Normalization_2/moments/Squeeze_1:output:0*
T0*
_output_shapes
:@�
1Value_Batch_Normalization_2/AssignMovingAvg_1/mulMul5Value_Batch_Normalization_2/AssignMovingAvg_1/sub:z:0<Value_Batch_Normalization_2/AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:@�
-Value_Batch_Normalization_2/AssignMovingAvg_1AssignSubVariableOpEvalue_batch_normalization_2_assignmovingavg_1_readvariableop_resource5Value_Batch_Normalization_2/AssignMovingAvg_1/mul:z:0=^Value_Batch_Normalization_2/AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0p
+Value_Batch_Normalization_2/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o�:�
)Value_Batch_Normalization_2/batchnorm/addAddV26Value_Batch_Normalization_2/moments/Squeeze_1:output:04Value_Batch_Normalization_2/batchnorm/add/y:output:0*
T0*
_output_shapes
:@�
+Value_Batch_Normalization_2/batchnorm/RsqrtRsqrt-Value_Batch_Normalization_2/batchnorm/add:z:0*
T0*
_output_shapes
:@�
8Value_Batch_Normalization_2/batchnorm/mul/ReadVariableOpReadVariableOpAvalue_batch_normalization_2_batchnorm_mul_readvariableop_resource*
_output_shapes
:@*
dtype0�
)Value_Batch_Normalization_2/batchnorm/mulMul/Value_Batch_Normalization_2/batchnorm/Rsqrt:y:0@Value_Batch_Normalization_2/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:@�
+Value_Batch_Normalization_2/batchnorm/mul_1Mul$Value_Dense_Layer/Relu:activations:0-Value_Batch_Normalization_2/batchnorm/mul:z:0*
T0*'
_output_shapes
:���������@�
+Value_Batch_Normalization_2/batchnorm/mul_2Mul4Value_Batch_Normalization_2/moments/Squeeze:output:0-Value_Batch_Normalization_2/batchnorm/mul:z:0*
T0*
_output_shapes
:@�
4Value_Batch_Normalization_2/batchnorm/ReadVariableOpReadVariableOp=value_batch_normalization_2_batchnorm_readvariableop_resource*
_output_shapes
:@*
dtype0�
)Value_Batch_Normalization_2/batchnorm/subSub<Value_Batch_Normalization_2/batchnorm/ReadVariableOp:value:0/Value_Batch_Normalization_2/batchnorm/mul_2:z:0*
T0*
_output_shapes
:@�
+Value_Batch_Normalization_2/batchnorm/add_1AddV2/Value_Batch_Normalization_2/batchnorm/mul_1:z:0-Value_Batch_Normalization_2/batchnorm/sub:z:0*
T0*'
_output_shapes
:���������@�
!Policy_Head/MatMul/ReadVariableOpReadVariableOp*policy_head_matmul_readvariableop_resource*
_output_shapes
:	?�*
dtype0�
Policy_Head/MatMulMatMul%Policy_Flatten_Layer/Reshape:output:0)Policy_Head/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
"Policy_Head/BiasAdd/ReadVariableOpReadVariableOp+policy_head_biasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0�
Policy_Head/BiasAddBiasAddPolicy_Head/MatMul:product:0*Policy_Head/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������o
Policy_Head/SoftmaxSoftmaxPolicy_Head/BiasAdd:output:0*
T0*(
_output_shapes
:�����������
 Value_Head/MatMul/ReadVariableOpReadVariableOp)value_head_matmul_readvariableop_resource*
_output_shapes

:@*
dtype0�
Value_Head/MatMulMatMul/Value_Batch_Normalization_2/batchnorm/add_1:z:0(Value_Head/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
!Value_Head/BiasAdd/ReadVariableOpReadVariableOp*value_head_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
Value_Head/BiasAddBiasAddValue_Head/MatMul:product:0)Value_Head/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������f
Value_Head/TanhTanhValue_Head/BiasAdd:output:0*
T0*'
_output_shapes
:����������
>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOpReadVariableOp4convolutional_layer_0_conv2d_readvariableop_resource*'
_output_shapes
:�*
dtype0�
/Convolutional_Layer_0/kernel/Regularizer/SquareSquareFConvolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*'
_output_shapes
:��
.Convolutional_Layer_0/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_0/kernel/Regularizer/SumSum3Convolutional_Layer_0/kernel/Regularizer/Square:y:07Convolutional_Layer_0/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_0/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_0/kernel/Regularizer/mulMul7Convolutional_Layer_0/kernel/Regularizer/mul/x:output:05Convolutional_Layer_0/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOpReadVariableOp5convolutional_layer_0_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_0/bias/Regularizer/SquareSquareDConvolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_0/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_0/bias/Regularizer/SumSum1Convolutional_Layer_0/bias/Regularizer/Square:y:05Convolutional_Layer_0/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_0/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_0/bias/Regularizer/mulMul5Convolutional_Layer_0/bias/Regularizer/mul/x:output:03Convolutional_Layer_0/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp4convolutional_layer_1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_1/kernel/Regularizer/SquareSquareFConvolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_1/kernel/Regularizer/SumSum3Convolutional_Layer_1/kernel/Regularizer/Square:y:07Convolutional_Layer_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_1/kernel/Regularizer/mulMul7Convolutional_Layer_1/kernel/Regularizer/mul/x:output:05Convolutional_Layer_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpReadVariableOp5convolutional_layer_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_1/bias/Regularizer/SquareSquareDConvolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_1/bias/Regularizer/SumSum1Convolutional_Layer_1/bias/Regularizer/Square:y:05Convolutional_Layer_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_1/bias/Regularizer/mulMul5Convolutional_Layer_1/bias/Regularizer/mul/x:output:03Convolutional_Layer_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp4convolutional_layer_2_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_2/kernel/Regularizer/SquareSquareFConvolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_2/kernel/Regularizer/SumSum3Convolutional_Layer_2/kernel/Regularizer/Square:y:07Convolutional_Layer_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_2/kernel/Regularizer/mulMul7Convolutional_Layer_2/kernel/Regularizer/mul/x:output:05Convolutional_Layer_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpReadVariableOp5convolutional_layer_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_2/bias/Regularizer/SquareSquareDConvolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_2/bias/Regularizer/SumSum1Convolutional_Layer_2/bias/Regularizer/Square:y:05Convolutional_Layer_2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_2/bias/Regularizer/mulMul5Convolutional_Layer_2/bias/Regularizer/mul/x:output:03Convolutional_Layer_2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOpReadVariableOp4convolutional_layer_3_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_3/kernel/Regularizer/SquareSquareFConvolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_3/kernel/Regularizer/SumSum3Convolutional_Layer_3/kernel/Regularizer/Square:y:07Convolutional_Layer_3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_3/kernel/Regularizer/mulMul7Convolutional_Layer_3/kernel/Regularizer/mul/x:output:05Convolutional_Layer_3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOpReadVariableOp5convolutional_layer_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_3/bias/Regularizer/SquareSquareDConvolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_3/bias/Regularizer/SumSum1Convolutional_Layer_3/bias/Regularizer/Square:y:05Convolutional_Layer_3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_3/bias/Regularizer/mulMul5Convolutional_Layer_3/bias/Regularizer/mul/x:output:03Convolutional_Layer_3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOpReadVariableOp4convolutional_layer_4_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_4/kernel/Regularizer/SquareSquareFConvolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_4/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_4/kernel/Regularizer/SumSum3Convolutional_Layer_4/kernel/Regularizer/Square:y:07Convolutional_Layer_4/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_4/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_4/kernel/Regularizer/mulMul7Convolutional_Layer_4/kernel/Regularizer/mul/x:output:05Convolutional_Layer_4/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOpReadVariableOp5convolutional_layer_4_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_4/bias/Regularizer/SquareSquareDConvolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_4/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_4/bias/Regularizer/SumSum1Convolutional_Layer_4/bias/Regularizer/Square:y:05Convolutional_Layer_4/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_4/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_4/bias/Regularizer/mulMul5Convolutional_Layer_4/bias/Regularizer/mul/x:output:03Convolutional_Layer_4/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOpReadVariableOp4convolutional_layer_5_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_5/kernel/Regularizer/SquareSquareFConvolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_5/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_5/kernel/Regularizer/SumSum3Convolutional_Layer_5/kernel/Regularizer/Square:y:07Convolutional_Layer_5/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_5/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_5/kernel/Regularizer/mulMul7Convolutional_Layer_5/kernel/Regularizer/mul/x:output:05Convolutional_Layer_5/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOpReadVariableOp5convolutional_layer_5_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_5/bias/Regularizer/SquareSquareDConvolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_5/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_5/bias/Regularizer/SumSum1Convolutional_Layer_5/bias/Regularizer/Square:y:05Convolutional_Layer_5/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_5/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_5/bias/Regularizer/mulMul5Convolutional_Layer_5/bias/Regularizer/mul/x:output:03Convolutional_Layer_5/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOpReadVariableOp8value_convolutional_layer_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
3Value_Convolutional_Layer/kernel/Regularizer/SquareSquareJValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
2Value_Convolutional_Layer/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
0Value_Convolutional_Layer/kernel/Regularizer/SumSum7Value_Convolutional_Layer/kernel/Regularizer/Square:y:0;Value_Convolutional_Layer/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: w
2Value_Convolutional_Layer/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
0Value_Convolutional_Layer/kernel/Regularizer/mulMul;Value_Convolutional_Layer/kernel/Regularizer/mul/x:output:09Value_Convolutional_Layer/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOpReadVariableOp9value_convolutional_layer_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
1Value_Convolutional_Layer/bias/Regularizer/SquareSquareHValue_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:z
0Value_Convolutional_Layer/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
.Value_Convolutional_Layer/bias/Regularizer/SumSum5Value_Convolutional_Layer/bias/Regularizer/Square:y:09Value_Convolutional_Layer/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: u
0Value_Convolutional_Layer/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
.Value_Convolutional_Layer/bias/Regularizer/mulMul9Value_Convolutional_Layer/bias/Regularizer/mul/x:output:07Value_Convolutional_Layer/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp;policy_convolutional_layer_1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
6Policy_Convolutional_Layer_1/kernel/Regularizer/SquareSquareMPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
5Policy_Convolutional_Layer_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3Policy_Convolutional_Layer_1/kernel/Regularizer/SumSum:Policy_Convolutional_Layer_1/kernel/Regularizer/Square:y:0>Policy_Convolutional_Layer_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5Policy_Convolutional_Layer_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
3Policy_Convolutional_Layer_1/kernel/Regularizer/mulMul>Policy_Convolutional_Layer_1/kernel/Regularizer/mul/x:output:0<Policy_Convolutional_Layer_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpReadVariableOp<policy_convolutional_layer_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
4Policy_Convolutional_Layer_1/bias/Regularizer/SquareSquareKPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:}
3Policy_Convolutional_Layer_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
1Policy_Convolutional_Layer_1/bias/Regularizer/SumSum8Policy_Convolutional_Layer_1/bias/Regularizer/Square:y:0<Policy_Convolutional_Layer_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: x
3Policy_Convolutional_Layer_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
1Policy_Convolutional_Layer_1/bias/Regularizer/mulMul<Policy_Convolutional_Layer_1/bias/Regularizer/mul/x:output:0:Policy_Convolutional_Layer_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp;policy_convolutional_layer_2_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
6Policy_Convolutional_Layer_2/kernel/Regularizer/SquareSquareMPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
5Policy_Convolutional_Layer_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3Policy_Convolutional_Layer_2/kernel/Regularizer/SumSum:Policy_Convolutional_Layer_2/kernel/Regularizer/Square:y:0>Policy_Convolutional_Layer_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5Policy_Convolutional_Layer_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
3Policy_Convolutional_Layer_2/kernel/Regularizer/mulMul>Policy_Convolutional_Layer_2/kernel/Regularizer/mul/x:output:0<Policy_Convolutional_Layer_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpReadVariableOp<policy_convolutional_layer_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
4Policy_Convolutional_Layer_2/bias/Regularizer/SquareSquareKPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:}
3Policy_Convolutional_Layer_2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
1Policy_Convolutional_Layer_2/bias/Regularizer/SumSum8Policy_Convolutional_Layer_2/bias/Regularizer/Square:y:0<Policy_Convolutional_Layer_2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: x
3Policy_Convolutional_Layer_2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
1Policy_Convolutional_Layer_2/bias/Regularizer/mulMul<Policy_Convolutional_Layer_2/bias/Regularizer/mul/x:output:0:Policy_Convolutional_Layer_2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOpReadVariableOp0value_dense_layer_matmul_readvariableop_resource*
_output_shapes

:?@*
dtype0�
+Value_Dense_Layer/kernel/Regularizer/SquareSquareBValue_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:?@{
*Value_Dense_Layer/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
(Value_Dense_Layer/kernel/Regularizer/SumSum/Value_Dense_Layer/kernel/Regularizer/Square:y:03Value_Dense_Layer/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: o
*Value_Dense_Layer/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
(Value_Dense_Layer/kernel/Regularizer/mulMul3Value_Dense_Layer/kernel/Regularizer/mul/x:output:01Value_Dense_Layer/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOpReadVariableOp1value_dense_layer_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
)Value_Dense_Layer/bias/Regularizer/SquareSquare@Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:@r
(Value_Dense_Layer/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
&Value_Dense_Layer/bias/Regularizer/SumSum-Value_Dense_Layer/bias/Regularizer/Square:y:01Value_Dense_Layer/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: m
(Value_Dense_Layer/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
&Value_Dense_Layer/bias/Regularizer/mulMul1Value_Dense_Layer/bias/Regularizer/mul/x:output:0/Value_Dense_Layer/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
3Value_Head/kernel/Regularizer/Square/ReadVariableOpReadVariableOp)value_head_matmul_readvariableop_resource*
_output_shapes

:@*
dtype0�
$Value_Head/kernel/Regularizer/SquareSquare;Value_Head/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@t
#Value_Head/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
!Value_Head/kernel/Regularizer/SumSum(Value_Head/kernel/Regularizer/Square:y:0,Value_Head/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: h
#Value_Head/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
!Value_Head/kernel/Regularizer/mulMul,Value_Head/kernel/Regularizer/mul/x:output:0*Value_Head/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
1Value_Head/bias/Regularizer/Square/ReadVariableOpReadVariableOp*value_head_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"Value_Head/bias/Regularizer/SquareSquare9Value_Head/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:k
!Value_Head/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
Value_Head/bias/Regularizer/SumSum&Value_Head/bias/Regularizer/Square:y:0*Value_Head/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: f
!Value_Head/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
Value_Head/bias/Regularizer/mulMul*Value_Head/bias/Regularizer/mul/x:output:0(Value_Head/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
4Policy_Head/kernel/Regularizer/Square/ReadVariableOpReadVariableOp*policy_head_matmul_readvariableop_resource*
_output_shapes
:	?�*
dtype0�
%Policy_Head/kernel/Regularizer/SquareSquare<Policy_Head/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?�u
$Policy_Head/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
"Policy_Head/kernel/Regularizer/SumSum)Policy_Head/kernel/Regularizer/Square:y:0-Policy_Head/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$Policy_Head/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
"Policy_Head/kernel/Regularizer/mulMul-Policy_Head/kernel/Regularizer/mul/x:output:0+Policy_Head/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
2Policy_Head/bias/Regularizer/Square/ReadVariableOpReadVariableOp+policy_head_biasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0�
#Policy_Head/bias/Regularizer/SquareSquare:Policy_Head/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes	
:�l
"Policy_Head/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
 Policy_Head/bias/Regularizer/SumSum'Policy_Head/bias/Regularizer/Square:y:0+Policy_Head/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: g
"Policy_Head/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
 Policy_Head/bias/Regularizer/mulMul+Policy_Head/bias/Regularizer/mul/x:output:0)Policy_Head/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: b
IdentityIdentityValue_Head/Tanh:y:0^NoOp*
T0*'
_output_shapes
:���������o

Identity_1IdentityPolicy_Head/Softmax:softmax:0^NoOp*
T0*(
_output_shapes
:�����������+
NoOpNoOp%^Batch_Normalization_0/AssignNewValue'^Batch_Normalization_0/AssignNewValue_16^Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp8^Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp_1%^Batch_Normalization_0/ReadVariableOp'^Batch_Normalization_0/ReadVariableOp_1%^Batch_Normalization_1/AssignNewValue'^Batch_Normalization_1/AssignNewValue_16^Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp8^Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1%^Batch_Normalization_1/ReadVariableOp'^Batch_Normalization_1/ReadVariableOp_1%^Batch_Normalization_2/AssignNewValue'^Batch_Normalization_2/AssignNewValue_16^Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp8^Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1%^Batch_Normalization_2/ReadVariableOp'^Batch_Normalization_2/ReadVariableOp_1%^Batch_Normalization_3/AssignNewValue'^Batch_Normalization_3/AssignNewValue_16^Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp8^Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp_1%^Batch_Normalization_3/ReadVariableOp'^Batch_Normalization_3/ReadVariableOp_1%^Batch_Normalization_4/AssignNewValue'^Batch_Normalization_4/AssignNewValue_16^Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp8^Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp_1%^Batch_Normalization_4/ReadVariableOp'^Batch_Normalization_4/ReadVariableOp_1%^Batch_Normalization_5/AssignNewValue'^Batch_Normalization_5/AssignNewValue_16^Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp8^Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp_1%^Batch_Normalization_5/ReadVariableOp'^Batch_Normalization_5/ReadVariableOp_1-^Convolutional_Layer_0/BiasAdd/ReadVariableOp,^Convolutional_Layer_0/Conv2D/ReadVariableOp=^Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp-^Convolutional_Layer_1/BiasAdd/ReadVariableOp,^Convolutional_Layer_1/Conv2D/ReadVariableOp=^Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp-^Convolutional_Layer_2/BiasAdd/ReadVariableOp,^Convolutional_Layer_2/Conv2D/ReadVariableOp=^Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp-^Convolutional_Layer_3/BiasAdd/ReadVariableOp,^Convolutional_Layer_3/Conv2D/ReadVariableOp=^Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp-^Convolutional_Layer_4/BiasAdd/ReadVariableOp,^Convolutional_Layer_4/Conv2D/ReadVariableOp=^Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp-^Convolutional_Layer_5/BiasAdd/ReadVariableOp,^Convolutional_Layer_5/Conv2D/ReadVariableOp=^Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp,^Policy_Batch_Normalization_1/AssignNewValue.^Policy_Batch_Normalization_1/AssignNewValue_1=^Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp?^Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1,^Policy_Batch_Normalization_1/ReadVariableOp.^Policy_Batch_Normalization_1/ReadVariableOp_1,^Policy_Batch_Normalization_2/AssignNewValue.^Policy_Batch_Normalization_2/AssignNewValue_1=^Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp?^Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1,^Policy_Batch_Normalization_2/ReadVariableOp.^Policy_Batch_Normalization_2/ReadVariableOp_14^Policy_Convolutional_Layer_1/BiasAdd/ReadVariableOp3^Policy_Convolutional_Layer_1/Conv2D/ReadVariableOpD^Policy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpF^Policy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp4^Policy_Convolutional_Layer_2/BiasAdd/ReadVariableOp3^Policy_Convolutional_Layer_2/Conv2D/ReadVariableOpD^Policy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpF^Policy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp#^Policy_Head/BiasAdd/ReadVariableOp"^Policy_Head/MatMul/ReadVariableOp3^Policy_Head/bias/Regularizer/Square/ReadVariableOp5^Policy_Head/kernel/Regularizer/Square/ReadVariableOp+^Value_Batch_Normalization_1/AssignNewValue-^Value_Batch_Normalization_1/AssignNewValue_1<^Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp>^Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1+^Value_Batch_Normalization_1/ReadVariableOp-^Value_Batch_Normalization_1/ReadVariableOp_1,^Value_Batch_Normalization_2/AssignMovingAvg;^Value_Batch_Normalization_2/AssignMovingAvg/ReadVariableOp.^Value_Batch_Normalization_2/AssignMovingAvg_1=^Value_Batch_Normalization_2/AssignMovingAvg_1/ReadVariableOp5^Value_Batch_Normalization_2/batchnorm/ReadVariableOp9^Value_Batch_Normalization_2/batchnorm/mul/ReadVariableOp1^Value_Convolutional_Layer/BiasAdd/ReadVariableOp0^Value_Convolutional_Layer/Conv2D/ReadVariableOpA^Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOpC^Value_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp)^Value_Dense_Layer/BiasAdd/ReadVariableOp(^Value_Dense_Layer/MatMul/ReadVariableOp9^Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp;^Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp"^Value_Head/BiasAdd/ReadVariableOp!^Value_Head/MatMul/ReadVariableOp2^Value_Head/bias/Regularizer/Square/ReadVariableOp4^Value_Head/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������	�: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2L
$Batch_Normalization_0/AssignNewValue$Batch_Normalization_0/AssignNewValue2P
&Batch_Normalization_0/AssignNewValue_1&Batch_Normalization_0/AssignNewValue_12n
5Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp5Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp2r
7Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp_17Batch_Normalization_0/FusedBatchNormV3/ReadVariableOp_12L
$Batch_Normalization_0/ReadVariableOp$Batch_Normalization_0/ReadVariableOp2P
&Batch_Normalization_0/ReadVariableOp_1&Batch_Normalization_0/ReadVariableOp_12L
$Batch_Normalization_1/AssignNewValue$Batch_Normalization_1/AssignNewValue2P
&Batch_Normalization_1/AssignNewValue_1&Batch_Normalization_1/AssignNewValue_12n
5Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp5Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp2r
7Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_17Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_12L
$Batch_Normalization_1/ReadVariableOp$Batch_Normalization_1/ReadVariableOp2P
&Batch_Normalization_1/ReadVariableOp_1&Batch_Normalization_1/ReadVariableOp_12L
$Batch_Normalization_2/AssignNewValue$Batch_Normalization_2/AssignNewValue2P
&Batch_Normalization_2/AssignNewValue_1&Batch_Normalization_2/AssignNewValue_12n
5Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp5Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp2r
7Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_17Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_12L
$Batch_Normalization_2/ReadVariableOp$Batch_Normalization_2/ReadVariableOp2P
&Batch_Normalization_2/ReadVariableOp_1&Batch_Normalization_2/ReadVariableOp_12L
$Batch_Normalization_3/AssignNewValue$Batch_Normalization_3/AssignNewValue2P
&Batch_Normalization_3/AssignNewValue_1&Batch_Normalization_3/AssignNewValue_12n
5Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp5Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp2r
7Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp_17Batch_Normalization_3/FusedBatchNormV3/ReadVariableOp_12L
$Batch_Normalization_3/ReadVariableOp$Batch_Normalization_3/ReadVariableOp2P
&Batch_Normalization_3/ReadVariableOp_1&Batch_Normalization_3/ReadVariableOp_12L
$Batch_Normalization_4/AssignNewValue$Batch_Normalization_4/AssignNewValue2P
&Batch_Normalization_4/AssignNewValue_1&Batch_Normalization_4/AssignNewValue_12n
5Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp5Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp2r
7Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp_17Batch_Normalization_4/FusedBatchNormV3/ReadVariableOp_12L
$Batch_Normalization_4/ReadVariableOp$Batch_Normalization_4/ReadVariableOp2P
&Batch_Normalization_4/ReadVariableOp_1&Batch_Normalization_4/ReadVariableOp_12L
$Batch_Normalization_5/AssignNewValue$Batch_Normalization_5/AssignNewValue2P
&Batch_Normalization_5/AssignNewValue_1&Batch_Normalization_5/AssignNewValue_12n
5Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp5Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp2r
7Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp_17Batch_Normalization_5/FusedBatchNormV3/ReadVariableOp_12L
$Batch_Normalization_5/ReadVariableOp$Batch_Normalization_5/ReadVariableOp2P
&Batch_Normalization_5/ReadVariableOp_1&Batch_Normalization_5/ReadVariableOp_12\
,Convolutional_Layer_0/BiasAdd/ReadVariableOp,Convolutional_Layer_0/BiasAdd/ReadVariableOp2Z
+Convolutional_Layer_0/Conv2D/ReadVariableOp+Convolutional_Layer_0/Conv2D/ReadVariableOp2|
<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp2\
,Convolutional_Layer_1/BiasAdd/ReadVariableOp,Convolutional_Layer_1/BiasAdd/ReadVariableOp2Z
+Convolutional_Layer_1/Conv2D/ReadVariableOp+Convolutional_Layer_1/Conv2D/ReadVariableOp2|
<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp2\
,Convolutional_Layer_2/BiasAdd/ReadVariableOp,Convolutional_Layer_2/BiasAdd/ReadVariableOp2Z
+Convolutional_Layer_2/Conv2D/ReadVariableOp+Convolutional_Layer_2/Conv2D/ReadVariableOp2|
<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp2\
,Convolutional_Layer_3/BiasAdd/ReadVariableOp,Convolutional_Layer_3/BiasAdd/ReadVariableOp2Z
+Convolutional_Layer_3/Conv2D/ReadVariableOp+Convolutional_Layer_3/Conv2D/ReadVariableOp2|
<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp2\
,Convolutional_Layer_4/BiasAdd/ReadVariableOp,Convolutional_Layer_4/BiasAdd/ReadVariableOp2Z
+Convolutional_Layer_4/Conv2D/ReadVariableOp+Convolutional_Layer_4/Conv2D/ReadVariableOp2|
<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp2\
,Convolutional_Layer_5/BiasAdd/ReadVariableOp,Convolutional_Layer_5/BiasAdd/ReadVariableOp2Z
+Convolutional_Layer_5/Conv2D/ReadVariableOp+Convolutional_Layer_5/Conv2D/ReadVariableOp2|
<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp2Z
+Policy_Batch_Normalization_1/AssignNewValue+Policy_Batch_Normalization_1/AssignNewValue2^
-Policy_Batch_Normalization_1/AssignNewValue_1-Policy_Batch_Normalization_1/AssignNewValue_12|
<Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp<Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp2�
>Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1>Policy_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_12Z
+Policy_Batch_Normalization_1/ReadVariableOp+Policy_Batch_Normalization_1/ReadVariableOp2^
-Policy_Batch_Normalization_1/ReadVariableOp_1-Policy_Batch_Normalization_1/ReadVariableOp_12Z
+Policy_Batch_Normalization_2/AssignNewValue+Policy_Batch_Normalization_2/AssignNewValue2^
-Policy_Batch_Normalization_2/AssignNewValue_1-Policy_Batch_Normalization_2/AssignNewValue_12|
<Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp<Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp2�
>Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_1>Policy_Batch_Normalization_2/FusedBatchNormV3/ReadVariableOp_12Z
+Policy_Batch_Normalization_2/ReadVariableOp+Policy_Batch_Normalization_2/ReadVariableOp2^
-Policy_Batch_Normalization_2/ReadVariableOp_1-Policy_Batch_Normalization_2/ReadVariableOp_12j
3Policy_Convolutional_Layer_1/BiasAdd/ReadVariableOp3Policy_Convolutional_Layer_1/BiasAdd/ReadVariableOp2h
2Policy_Convolutional_Layer_1/Conv2D/ReadVariableOp2Policy_Convolutional_Layer_1/Conv2D/ReadVariableOp2�
CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpCPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp2�
EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpEPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp2j
3Policy_Convolutional_Layer_2/BiasAdd/ReadVariableOp3Policy_Convolutional_Layer_2/BiasAdd/ReadVariableOp2h
2Policy_Convolutional_Layer_2/Conv2D/ReadVariableOp2Policy_Convolutional_Layer_2/Conv2D/ReadVariableOp2�
CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpCPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp2�
EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpEPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp2H
"Policy_Head/BiasAdd/ReadVariableOp"Policy_Head/BiasAdd/ReadVariableOp2F
!Policy_Head/MatMul/ReadVariableOp!Policy_Head/MatMul/ReadVariableOp2h
2Policy_Head/bias/Regularizer/Square/ReadVariableOp2Policy_Head/bias/Regularizer/Square/ReadVariableOp2l
4Policy_Head/kernel/Regularizer/Square/ReadVariableOp4Policy_Head/kernel/Regularizer/Square/ReadVariableOp2X
*Value_Batch_Normalization_1/AssignNewValue*Value_Batch_Normalization_1/AssignNewValue2\
,Value_Batch_Normalization_1/AssignNewValue_1,Value_Batch_Normalization_1/AssignNewValue_12z
;Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp;Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp2~
=Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_1=Value_Batch_Normalization_1/FusedBatchNormV3/ReadVariableOp_12X
*Value_Batch_Normalization_1/ReadVariableOp*Value_Batch_Normalization_1/ReadVariableOp2\
,Value_Batch_Normalization_1/ReadVariableOp_1,Value_Batch_Normalization_1/ReadVariableOp_12Z
+Value_Batch_Normalization_2/AssignMovingAvg+Value_Batch_Normalization_2/AssignMovingAvg2x
:Value_Batch_Normalization_2/AssignMovingAvg/ReadVariableOp:Value_Batch_Normalization_2/AssignMovingAvg/ReadVariableOp2^
-Value_Batch_Normalization_2/AssignMovingAvg_1-Value_Batch_Normalization_2/AssignMovingAvg_12|
<Value_Batch_Normalization_2/AssignMovingAvg_1/ReadVariableOp<Value_Batch_Normalization_2/AssignMovingAvg_1/ReadVariableOp2l
4Value_Batch_Normalization_2/batchnorm/ReadVariableOp4Value_Batch_Normalization_2/batchnorm/ReadVariableOp2t
8Value_Batch_Normalization_2/batchnorm/mul/ReadVariableOp8Value_Batch_Normalization_2/batchnorm/mul/ReadVariableOp2d
0Value_Convolutional_Layer/BiasAdd/ReadVariableOp0Value_Convolutional_Layer/BiasAdd/ReadVariableOp2b
/Value_Convolutional_Layer/Conv2D/ReadVariableOp/Value_Convolutional_Layer/Conv2D/ReadVariableOp2�
@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp2�
BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOpBValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp2T
(Value_Dense_Layer/BiasAdd/ReadVariableOp(Value_Dense_Layer/BiasAdd/ReadVariableOp2R
'Value_Dense_Layer/MatMul/ReadVariableOp'Value_Dense_Layer/MatMul/ReadVariableOp2t
8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp2x
:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp2F
!Value_Head/BiasAdd/ReadVariableOp!Value_Head/BiasAdd/ReadVariableOp2D
 Value_Head/MatMul/ReadVariableOp Value_Head/MatMul/ReadVariableOp2f
1Value_Head/bias/Regularizer/Square/ReadVariableOp1Value_Head/bias/Regularizer/Square/ReadVariableOp2j
3Value_Head/kernel/Regularizer/Square/ReadVariableOp3Value_Head/kernel/Regularizer/Square/ReadVariableOp:X T
0
_output_shapes
:���������	�
 
_user_specified_nameinputs
�
�
V__inference_Policy_Convolutional_Layer_1_layer_call_and_return_conditional_losses_2617

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp�EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������	�
EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
6Policy_Convolutional_Layer_1/kernel/Regularizer/SquareSquareMPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
5Policy_Convolutional_Layer_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3Policy_Convolutional_Layer_1/kernel/Regularizer/SumSum:Policy_Convolutional_Layer_1/kernel/Regularizer/Square:y:0>Policy_Convolutional_Layer_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5Policy_Convolutional_Layer_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
3Policy_Convolutional_Layer_1/kernel/Regularizer/mulMul>Policy_Convolutional_Layer_1/kernel/Regularizer/mul/x:output:0<Policy_Convolutional_Layer_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
4Policy_Convolutional_Layer_1/bias/Regularizer/SquareSquareKPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:}
3Policy_Convolutional_Layer_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
1Policy_Convolutional_Layer_1/bias/Regularizer/SumSum8Policy_Convolutional_Layer_1/bias/Regularizer/Square:y:0<Policy_Convolutional_Layer_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: x
3Policy_Convolutional_Layer_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
1Policy_Convolutional_Layer_1/bias/Regularizer/mulMul<Policy_Convolutional_Layer_1/bias/Regularizer/mul/x:output:0:Policy_Convolutional_Layer_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOpD^Policy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpF^Policy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2�
CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpCPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp2�
EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpEPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
i
M__inference_Value_Flatten_Layer_layer_call_and_return_conditional_losses_7667

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"����?   \
ReshapeReshapeinputsConst:output:0*
T0*'
_output_shapes
:���������?X
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:���������?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
4__inference_Convolutional_Layer_1_layer_call_fn_6501

inputs!
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_1_layer_call_and_return_conditional_losses_2337w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
4__inference_Convolutional_Layer_3_layer_call_fn_6837

inputs!
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_3_layer_call_and_return_conditional_losses_2449w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
__inference_loss_fn_18_8267U
Cvalue_dense_layer_kernel_regularizer_square_readvariableop_resource:?@
identity��:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp�
:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOpReadVariableOpCvalue_dense_layer_kernel_regularizer_square_readvariableop_resource*
_output_shapes

:?@*
dtype0�
+Value_Dense_Layer/kernel/Regularizer/SquareSquareBValue_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:?@{
*Value_Dense_Layer/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
(Value_Dense_Layer/kernel/Regularizer/SumSum/Value_Dense_Layer/kernel/Regularizer/Square:y:03Value_Dense_Layer/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: o
*Value_Dense_Layer/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
(Value_Dense_Layer/kernel/Regularizer/mulMul3Value_Dense_Layer/kernel/Regularizer/mul/x:output:01Value_Dense_Layer/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: j
IdentityIdentity,Value_Dense_Layer/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp;^Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2x
:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp
�
�
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_6948

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_3390

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
4__inference_Batch_Normalization_0_layer_call_fn_6408

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_3660w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_3222

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
j
N__inference_Policy_Flatten_Layer_layer_call_and_return_conditional_losses_7970

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"����?   \
ReshapeReshapeinputsConst:output:0*
T0*'
_output_shapes
:���������?X
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:���������?"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_1966

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
V__inference_Policy_Convolutional_Layer_1_layer_call_and_return_conditional_losses_7408

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp�EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������	�
EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
6Policy_Convolutional_Layer_1/kernel/Regularizer/SquareSquareMPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
5Policy_Convolutional_Layer_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3Policy_Convolutional_Layer_1/kernel/Regularizer/SumSum:Policy_Convolutional_Layer_1/kernel/Regularizer/Square:y:0>Policy_Convolutional_Layer_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5Policy_Convolutional_Layer_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
3Policy_Convolutional_Layer_1/kernel/Regularizer/mulMul>Policy_Convolutional_Layer_1/kernel/Regularizer/mul/x:output:0<Policy_Convolutional_Layer_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
4Policy_Convolutional_Layer_1/bias/Regularizer/SquareSquareKPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:}
3Policy_Convolutional_Layer_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
1Policy_Convolutional_Layer_1/bias/Regularizer/SumSum8Policy_Convolutional_Layer_1/bias/Regularizer/Square:y:0<Policy_Convolutional_Layer_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: x
3Policy_Convolutional_Layer_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
1Policy_Convolutional_Layer_1/bias/Regularizer/mulMul<Policy_Convolutional_Layer_1/bias/Regularizer/mul/x:output:0:Policy_Convolutional_Layer_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOpD^Policy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpF^Policy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2�
CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpCPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp2�
EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpEPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_7825

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_7879

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_3326

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_1646

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_6630

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
*__inference_Policy_Head_layer_call_fn_8035

inputs
unknown:	?�
	unknown_0:	�
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *N
fIRG
E__inference_Policy_Head_layer_call_and_return_conditional_losses_2839p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:����������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������?: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������?
 
_user_specified_nameinputs
�
�
4__inference_Batch_Normalization_4_layer_call_fn_7067

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_2528w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_3552

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��AssignNewValue�AssignNewValue_1�FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
exponential_avg_factor%
�#<�
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0�
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_2416

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:���������	:::::*
epsilon%o�:*
is_training( k
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
:__inference_Value_Batch_Normalization_1_layer_call_fn_7460

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *^
fYRW
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_3282w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_6426

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
__inference_loss_fn_15_8234Z
Lpolicy_convolutional_layer_1_bias_regularizer_square_readvariableop_resource:
identity��CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp�
CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpReadVariableOpLpolicy_convolutional_layer_1_bias_regularizer_square_readvariableop_resource*
_output_shapes
:*
dtype0�
4Policy_Convolutional_Layer_1/bias/Regularizer/SquareSquareKPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:}
3Policy_Convolutional_Layer_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
1Policy_Convolutional_Layer_1/bias/Regularizer/SumSum8Policy_Convolutional_Layer_1/bias/Regularizer/Square:y:0<Policy_Convolutional_Layer_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: x
3Policy_Convolutional_Layer_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
1Policy_Convolutional_Layer_1/bias/Regularizer/mulMul<Policy_Convolutional_Layer_1/bias/Regularizer/mul/x:output:0:Policy_Convolutional_Layer_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: s
IdentityIdentity5Policy_Convolutional_Layer_1/bias/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOpD^Policy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2�
CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpCPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp
�
�
O__inference_Convolutional_Layer_4_layer_call_and_return_conditional_losses_2505

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������	�
>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_4/kernel/Regularizer/SquareSquareFConvolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_4/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_4/kernel/Regularizer/SumSum3Convolutional_Layer_4/kernel/Regularizer/Square:y:07Convolutional_Layer_4/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_4/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_4/kernel/Regularizer/mulMul7Convolutional_Layer_4/kernel/Regularizer/mul/x:output:05Convolutional_Layer_4/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_4/bias/Regularizer/SquareSquareDConvolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_4/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_4/bias/Regularizer/SumSum1Convolutional_Layer_4/bias/Regularizer/Square:y:05Convolutional_Layer_4/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_4/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_4/bias/Regularizer/mulMul5Convolutional_Layer_4/bias/Regularizer/mul/x:output:03Convolutional_Layer_4/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp=^Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2|
<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
4__inference_Batch_Normalization_2_layer_call_fn_6731

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_2416w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
��
�+
A__inference_model_1_layer_call_and_return_conditional_losses_4688
input_25
convolutional_layer_0_4390:�(
convolutional_layer_0_4392:(
batch_normalization_0_4395:(
batch_normalization_0_4397:(
batch_normalization_0_4399:(
batch_normalization_0_4401:4
convolutional_layer_1_4404:(
convolutional_layer_1_4406:(
batch_normalization_1_4409:(
batch_normalization_1_4411:(
batch_normalization_1_4413:(
batch_normalization_1_4415:4
convolutional_layer_2_4418:(
convolutional_layer_2_4420:(
batch_normalization_2_4423:(
batch_normalization_2_4425:(
batch_normalization_2_4427:(
batch_normalization_2_4429:4
convolutional_layer_3_4432:(
convolutional_layer_3_4434:(
batch_normalization_3_4437:(
batch_normalization_3_4439:(
batch_normalization_3_4441:(
batch_normalization_3_4443:4
convolutional_layer_4_4446:(
convolutional_layer_4_4448:(
batch_normalization_4_4451:(
batch_normalization_4_4453:(
batch_normalization_4_4455:(
batch_normalization_4_4457:4
convolutional_layer_5_4460:(
convolutional_layer_5_4462:(
batch_normalization_5_4465:(
batch_normalization_5_4467:(
batch_normalization_5_4469:(
batch_normalization_5_4471:;
!policy_convolutional_layer_1_4474:/
!policy_convolutional_layer_1_4476:8
value_convolutional_layer_4479:,
value_convolutional_layer_4481:/
!policy_batch_normalization_1_4484:/
!policy_batch_normalization_1_4486:/
!policy_batch_normalization_1_4488:/
!policy_batch_normalization_1_4490:.
 value_batch_normalization_1_4493:.
 value_batch_normalization_1_4495:.
 value_batch_normalization_1_4497:.
 value_batch_normalization_1_4499:;
!policy_convolutional_layer_2_4502:/
!policy_convolutional_layer_2_4504:/
!policy_batch_normalization_2_4508:/
!policy_batch_normalization_2_4510:/
!policy_batch_normalization_2_4512:/
!policy_batch_normalization_2_4514:(
value_dense_layer_4517:?@$
value_dense_layer_4519:@.
 value_batch_normalization_2_4523:@.
 value_batch_normalization_2_4525:@.
 value_batch_normalization_2_4527:@.
 value_batch_normalization_2_4529:@#
policy_head_4532:	?�
policy_head_4534:	�!
value_head_4537:@
value_head_4539:
identity

identity_1��-Batch_Normalization_0/StatefulPartitionedCall�-Batch_Normalization_1/StatefulPartitionedCall�-Batch_Normalization_2/StatefulPartitionedCall�-Batch_Normalization_3/StatefulPartitionedCall�-Batch_Normalization_4/StatefulPartitionedCall�-Batch_Normalization_5/StatefulPartitionedCall�-Convolutional_Layer_0/StatefulPartitionedCall�<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp�-Convolutional_Layer_1/StatefulPartitionedCall�<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp�-Convolutional_Layer_2/StatefulPartitionedCall�<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp�-Convolutional_Layer_3/StatefulPartitionedCall�<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp�-Convolutional_Layer_4/StatefulPartitionedCall�<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp�-Convolutional_Layer_5/StatefulPartitionedCall�<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp�4Policy_Batch_Normalization_1/StatefulPartitionedCall�4Policy_Batch_Normalization_2/StatefulPartitionedCall�4Policy_Convolutional_Layer_1/StatefulPartitionedCall�CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp�EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp�4Policy_Convolutional_Layer_2/StatefulPartitionedCall�CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp�EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp�#Policy_Head/StatefulPartitionedCall�2Policy_Head/bias/Regularizer/Square/ReadVariableOp�4Policy_Head/kernel/Regularizer/Square/ReadVariableOp�3Value_Batch_Normalization_1/StatefulPartitionedCall�3Value_Batch_Normalization_2/StatefulPartitionedCall�1Value_Convolutional_Layer/StatefulPartitionedCall�@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp�BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp�)Value_Dense_Layer/StatefulPartitionedCall�8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp�:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp�"Value_Head/StatefulPartitionedCall�1Value_Head/bias/Regularizer/Square/ReadVariableOp�3Value_Head/kernel/Regularizer/Square/ReadVariableOp�
-Convolutional_Layer_0/StatefulPartitionedCallStatefulPartitionedCallinput_2convolutional_layer_0_4390convolutional_layer_0_4392*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_0_layer_call_and_return_conditional_losses_2281�
-Batch_Normalization_0/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_0/StatefulPartitionedCall:output:0batch_normalization_0_4395batch_normalization_0_4397batch_normalization_0_4399batch_normalization_0_4401*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_2304�
-Convolutional_Layer_1/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_0/StatefulPartitionedCall:output:0convolutional_layer_1_4404convolutional_layer_1_4406*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_1_layer_call_and_return_conditional_losses_2337�
-Batch_Normalization_1/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_1/StatefulPartitionedCall:output:0batch_normalization_1_4409batch_normalization_1_4411batch_normalization_1_4413batch_normalization_1_4415*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_2360�
-Convolutional_Layer_2/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_1/StatefulPartitionedCall:output:0convolutional_layer_2_4418convolutional_layer_2_4420*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_2_layer_call_and_return_conditional_losses_2393�
-Batch_Normalization_2/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_2/StatefulPartitionedCall:output:0batch_normalization_2_4423batch_normalization_2_4425batch_normalization_2_4427batch_normalization_2_4429*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_2416�
-Convolutional_Layer_3/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_2/StatefulPartitionedCall:output:0convolutional_layer_3_4432convolutional_layer_3_4434*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_3_layer_call_and_return_conditional_losses_2449�
-Batch_Normalization_3/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_3/StatefulPartitionedCall:output:0batch_normalization_3_4437batch_normalization_3_4439batch_normalization_3_4441batch_normalization_3_4443*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_2472�
-Convolutional_Layer_4/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_3/StatefulPartitionedCall:output:0convolutional_layer_4_4446convolutional_layer_4_4448*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_4_layer_call_and_return_conditional_losses_2505�
-Batch_Normalization_4/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_4/StatefulPartitionedCall:output:0batch_normalization_4_4451batch_normalization_4_4453batch_normalization_4_4455batch_normalization_4_4457*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_2528�
-Convolutional_Layer_5/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_4/StatefulPartitionedCall:output:0convolutional_layer_5_4460convolutional_layer_5_4462*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_5_layer_call_and_return_conditional_losses_2561�
-Batch_Normalization_5/StatefulPartitionedCallStatefulPartitionedCall6Convolutional_Layer_5/StatefulPartitionedCall:output:0batch_normalization_5_4465batch_normalization_5_4467batch_normalization_5_4469batch_normalization_5_4471*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_2584�
4Policy_Convolutional_Layer_1/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_5/StatefulPartitionedCall:output:0!policy_convolutional_layer_1_4474!policy_convolutional_layer_1_4476*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Convolutional_Layer_1_layer_call_and_return_conditional_losses_2617�
1Value_Convolutional_Layer/StatefulPartitionedCallStatefulPartitionedCall6Batch_Normalization_5/StatefulPartitionedCall:output:0value_convolutional_layer_4479value_convolutional_layer_4481*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *\
fWRU
S__inference_Value_Convolutional_Layer_layer_call_and_return_conditional_losses_2646�
4Policy_Batch_Normalization_1/StatefulPartitionedCallStatefulPartitionedCall=Policy_Convolutional_Layer_1/StatefulPartitionedCall:output:0!policy_batch_normalization_1_4484!policy_batch_normalization_1_4486!policy_batch_normalization_1_4488!policy_batch_normalization_1_4490*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_2669�
3Value_Batch_Normalization_1/StatefulPartitionedCallStatefulPartitionedCall:Value_Convolutional_Layer/StatefulPartitionedCall:output:0 value_batch_normalization_1_4493 value_batch_normalization_1_4495 value_batch_normalization_1_4497 value_batch_normalization_1_4499*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *^
fYRW
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_2696�
4Policy_Convolutional_Layer_2/StatefulPartitionedCallStatefulPartitionedCall=Policy_Batch_Normalization_1/StatefulPartitionedCall:output:0!policy_convolutional_layer_2_4502!policy_convolutional_layer_2_4504*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Convolutional_Layer_2_layer_call_and_return_conditional_losses_2729�
#Value_Flatten_Layer/PartitionedCallPartitionedCall<Value_Batch_Normalization_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_Value_Flatten_Layer_layer_call_and_return_conditional_losses_2741�
4Policy_Batch_Normalization_2/StatefulPartitionedCallStatefulPartitionedCall=Policy_Convolutional_Layer_2/StatefulPartitionedCall:output:0!policy_batch_normalization_2_4508!policy_batch_normalization_2_4510!policy_batch_normalization_2_4512!policy_batch_normalization_2_4514*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *_
fZRX
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_2760�
)Value_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall,Value_Flatten_Layer/PartitionedCall:output:0value_dense_layer_4517value_dense_layer_4519*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_Value_Dense_Layer_layer_call_and_return_conditional_losses_2793�
$Policy_Flatten_Layer/PartitionedCallPartitionedCall=Policy_Batch_Normalization_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������?* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *W
fRRP
N__inference_Policy_Flatten_Layer_layer_call_and_return_conditional_losses_2805�
3Value_Batch_Normalization_2/StatefulPartitionedCallStatefulPartitionedCall2Value_Dense_Layer/StatefulPartitionedCall:output:0 value_batch_normalization_2_4523 value_batch_normalization_2_4525 value_batch_normalization_2_4527 value_batch_normalization_2_4529*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *^
fYRW
U__inference_Value_Batch_Normalization_2_layer_call_and_return_conditional_losses_2193�
#Policy_Head/StatefulPartitionedCallStatefulPartitionedCall-Policy_Flatten_Layer/PartitionedCall:output:0policy_head_4532policy_head_4534*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *N
fIRG
E__inference_Policy_Head_layer_call_and_return_conditional_losses_2839�
"Value_Head/StatefulPartitionedCallStatefulPartitionedCall<Value_Batch_Normalization_2/StatefulPartitionedCall:output:0value_head_4537value_head_4539*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_Value_Head_layer_call_and_return_conditional_losses_2868�
>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_0_4390*'
_output_shapes
:�*
dtype0�
/Convolutional_Layer_0/kernel/Regularizer/SquareSquareFConvolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*'
_output_shapes
:��
.Convolutional_Layer_0/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_0/kernel/Regularizer/SumSum3Convolutional_Layer_0/kernel/Regularizer/Square:y:07Convolutional_Layer_0/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_0/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_0/kernel/Regularizer/mulMul7Convolutional_Layer_0/kernel/Regularizer/mul/x:output:05Convolutional_Layer_0/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_0_4392*
_output_shapes
:*
dtype0�
-Convolutional_Layer_0/bias/Regularizer/SquareSquareDConvolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_0/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_0/bias/Regularizer/SumSum1Convolutional_Layer_0/bias/Regularizer/Square:y:05Convolutional_Layer_0/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_0/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_0/bias/Regularizer/mulMul5Convolutional_Layer_0/bias/Regularizer/mul/x:output:03Convolutional_Layer_0/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_1_4404*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_1/kernel/Regularizer/SquareSquareFConvolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_1/kernel/Regularizer/SumSum3Convolutional_Layer_1/kernel/Regularizer/Square:y:07Convolutional_Layer_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_1/kernel/Regularizer/mulMul7Convolutional_Layer_1/kernel/Regularizer/mul/x:output:05Convolutional_Layer_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_1_4406*
_output_shapes
:*
dtype0�
-Convolutional_Layer_1/bias/Regularizer/SquareSquareDConvolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_1/bias/Regularizer/SumSum1Convolutional_Layer_1/bias/Regularizer/Square:y:05Convolutional_Layer_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_1/bias/Regularizer/mulMul5Convolutional_Layer_1/bias/Regularizer/mul/x:output:03Convolutional_Layer_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_2_4418*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_2/kernel/Regularizer/SquareSquareFConvolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_2/kernel/Regularizer/SumSum3Convolutional_Layer_2/kernel/Regularizer/Square:y:07Convolutional_Layer_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_2/kernel/Regularizer/mulMul7Convolutional_Layer_2/kernel/Regularizer/mul/x:output:05Convolutional_Layer_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_2_4420*
_output_shapes
:*
dtype0�
-Convolutional_Layer_2/bias/Regularizer/SquareSquareDConvolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_2/bias/Regularizer/SumSum1Convolutional_Layer_2/bias/Regularizer/Square:y:05Convolutional_Layer_2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_2/bias/Regularizer/mulMul5Convolutional_Layer_2/bias/Regularizer/mul/x:output:03Convolutional_Layer_2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_3_4432*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_3/kernel/Regularizer/SquareSquareFConvolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_3/kernel/Regularizer/SumSum3Convolutional_Layer_3/kernel/Regularizer/Square:y:07Convolutional_Layer_3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_3/kernel/Regularizer/mulMul7Convolutional_Layer_3/kernel/Regularizer/mul/x:output:05Convolutional_Layer_3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_3_4434*
_output_shapes
:*
dtype0�
-Convolutional_Layer_3/bias/Regularizer/SquareSquareDConvolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_3/bias/Regularizer/SumSum1Convolutional_Layer_3/bias/Regularizer/Square:y:05Convolutional_Layer_3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_3/bias/Regularizer/mulMul5Convolutional_Layer_3/bias/Regularizer/mul/x:output:03Convolutional_Layer_3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_4_4446*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_4/kernel/Regularizer/SquareSquareFConvolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_4/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_4/kernel/Regularizer/SumSum3Convolutional_Layer_4/kernel/Regularizer/Square:y:07Convolutional_Layer_4/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_4/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_4/kernel/Regularizer/mulMul7Convolutional_Layer_4/kernel/Regularizer/mul/x:output:05Convolutional_Layer_4/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_4_4448*
_output_shapes
:*
dtype0�
-Convolutional_Layer_4/bias/Regularizer/SquareSquareDConvolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_4/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_4/bias/Regularizer/SumSum1Convolutional_Layer_4/bias/Regularizer/Square:y:05Convolutional_Layer_4/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_4/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_4/bias/Regularizer/mulMul5Convolutional_Layer_4/bias/Regularizer/mul/x:output:03Convolutional_Layer_4/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_5_4460*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_5/kernel/Regularizer/SquareSquareFConvolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_5/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_5/kernel/Regularizer/SumSum3Convolutional_Layer_5/kernel/Regularizer/Square:y:07Convolutional_Layer_5/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_5/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_5/kernel/Regularizer/mulMul7Convolutional_Layer_5/kernel/Regularizer/mul/x:output:05Convolutional_Layer_5/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOpReadVariableOpconvolutional_layer_5_4462*
_output_shapes
:*
dtype0�
-Convolutional_Layer_5/bias/Regularizer/SquareSquareDConvolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_5/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_5/bias/Regularizer/SumSum1Convolutional_Layer_5/bias/Regularizer/Square:y:05Convolutional_Layer_5/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_5/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_5/bias/Regularizer/mulMul5Convolutional_Layer_5/bias/Regularizer/mul/x:output:03Convolutional_Layer_5/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOpReadVariableOpvalue_convolutional_layer_4479*&
_output_shapes
:*
dtype0�
3Value_Convolutional_Layer/kernel/Regularizer/SquareSquareJValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
2Value_Convolutional_Layer/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
0Value_Convolutional_Layer/kernel/Regularizer/SumSum7Value_Convolutional_Layer/kernel/Regularizer/Square:y:0;Value_Convolutional_Layer/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: w
2Value_Convolutional_Layer/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
0Value_Convolutional_Layer/kernel/Regularizer/mulMul;Value_Convolutional_Layer/kernel/Regularizer/mul/x:output:09Value_Convolutional_Layer/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOpReadVariableOpvalue_convolutional_layer_4481*
_output_shapes
:*
dtype0�
1Value_Convolutional_Layer/bias/Regularizer/SquareSquareHValue_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:z
0Value_Convolutional_Layer/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
.Value_Convolutional_Layer/bias/Regularizer/SumSum5Value_Convolutional_Layer/bias/Regularizer/Square:y:09Value_Convolutional_Layer/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: u
0Value_Convolutional_Layer/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
.Value_Convolutional_Layer/bias/Regularizer/mulMul9Value_Convolutional_Layer/bias/Regularizer/mul/x:output:07Value_Convolutional_Layer/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp!policy_convolutional_layer_1_4474*&
_output_shapes
:*
dtype0�
6Policy_Convolutional_Layer_1/kernel/Regularizer/SquareSquareMPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
5Policy_Convolutional_Layer_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3Policy_Convolutional_Layer_1/kernel/Regularizer/SumSum:Policy_Convolutional_Layer_1/kernel/Regularizer/Square:y:0>Policy_Convolutional_Layer_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5Policy_Convolutional_Layer_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
3Policy_Convolutional_Layer_1/kernel/Regularizer/mulMul>Policy_Convolutional_Layer_1/kernel/Regularizer/mul/x:output:0<Policy_Convolutional_Layer_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpReadVariableOp!policy_convolutional_layer_1_4476*
_output_shapes
:*
dtype0�
4Policy_Convolutional_Layer_1/bias/Regularizer/SquareSquareKPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:}
3Policy_Convolutional_Layer_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
1Policy_Convolutional_Layer_1/bias/Regularizer/SumSum8Policy_Convolutional_Layer_1/bias/Regularizer/Square:y:0<Policy_Convolutional_Layer_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: x
3Policy_Convolutional_Layer_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
1Policy_Convolutional_Layer_1/bias/Regularizer/mulMul<Policy_Convolutional_Layer_1/bias/Regularizer/mul/x:output:0:Policy_Convolutional_Layer_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp!policy_convolutional_layer_2_4502*&
_output_shapes
:*
dtype0�
6Policy_Convolutional_Layer_2/kernel/Regularizer/SquareSquareMPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
5Policy_Convolutional_Layer_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3Policy_Convolutional_Layer_2/kernel/Regularizer/SumSum:Policy_Convolutional_Layer_2/kernel/Regularizer/Square:y:0>Policy_Convolutional_Layer_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5Policy_Convolutional_Layer_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
3Policy_Convolutional_Layer_2/kernel/Regularizer/mulMul>Policy_Convolutional_Layer_2/kernel/Regularizer/mul/x:output:0<Policy_Convolutional_Layer_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpReadVariableOp!policy_convolutional_layer_2_4504*
_output_shapes
:*
dtype0�
4Policy_Convolutional_Layer_2/bias/Regularizer/SquareSquareKPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:}
3Policy_Convolutional_Layer_2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
1Policy_Convolutional_Layer_2/bias/Regularizer/SumSum8Policy_Convolutional_Layer_2/bias/Regularizer/Square:y:0<Policy_Convolutional_Layer_2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: x
3Policy_Convolutional_Layer_2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
1Policy_Convolutional_Layer_2/bias/Regularizer/mulMul<Policy_Convolutional_Layer_2/bias/Regularizer/mul/x:output:0:Policy_Convolutional_Layer_2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOpReadVariableOpvalue_dense_layer_4517*
_output_shapes

:?@*
dtype0�
+Value_Dense_Layer/kernel/Regularizer/SquareSquareBValue_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:?@{
*Value_Dense_Layer/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
(Value_Dense_Layer/kernel/Regularizer/SumSum/Value_Dense_Layer/kernel/Regularizer/Square:y:03Value_Dense_Layer/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: o
*Value_Dense_Layer/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
(Value_Dense_Layer/kernel/Regularizer/mulMul3Value_Dense_Layer/kernel/Regularizer/mul/x:output:01Value_Dense_Layer/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOpReadVariableOpvalue_dense_layer_4519*
_output_shapes
:@*
dtype0�
)Value_Dense_Layer/bias/Regularizer/SquareSquare@Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:@r
(Value_Dense_Layer/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
&Value_Dense_Layer/bias/Regularizer/SumSum-Value_Dense_Layer/bias/Regularizer/Square:y:01Value_Dense_Layer/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: m
(Value_Dense_Layer/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
&Value_Dense_Layer/bias/Regularizer/mulMul1Value_Dense_Layer/bias/Regularizer/mul/x:output:0/Value_Dense_Layer/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
3Value_Head/kernel/Regularizer/Square/ReadVariableOpReadVariableOpvalue_head_4537*
_output_shapes

:@*
dtype0�
$Value_Head/kernel/Regularizer/SquareSquare;Value_Head/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@t
#Value_Head/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
!Value_Head/kernel/Regularizer/SumSum(Value_Head/kernel/Regularizer/Square:y:0,Value_Head/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: h
#Value_Head/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
!Value_Head/kernel/Regularizer/mulMul,Value_Head/kernel/Regularizer/mul/x:output:0*Value_Head/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: }
1Value_Head/bias/Regularizer/Square/ReadVariableOpReadVariableOpvalue_head_4539*
_output_shapes
:*
dtype0�
"Value_Head/bias/Regularizer/SquareSquare9Value_Head/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:k
!Value_Head/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
Value_Head/bias/Regularizer/SumSum&Value_Head/bias/Regularizer/Square:y:0*Value_Head/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: f
!Value_Head/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
Value_Head/bias/Regularizer/mulMul*Value_Head/bias/Regularizer/mul/x:output:0(Value_Head/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
4Policy_Head/kernel/Regularizer/Square/ReadVariableOpReadVariableOppolicy_head_4532*
_output_shapes
:	?�*
dtype0�
%Policy_Head/kernel/Regularizer/SquareSquare<Policy_Head/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?�u
$Policy_Head/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
"Policy_Head/kernel/Regularizer/SumSum)Policy_Head/kernel/Regularizer/Square:y:0-Policy_Head/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$Policy_Head/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
"Policy_Head/kernel/Regularizer/mulMul-Policy_Head/kernel/Regularizer/mul/x:output:0+Policy_Head/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
2Policy_Head/bias/Regularizer/Square/ReadVariableOpReadVariableOppolicy_head_4534*
_output_shapes	
:�*
dtype0�
#Policy_Head/bias/Regularizer/SquareSquare:Policy_Head/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes	
:�l
"Policy_Head/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
 Policy_Head/bias/Regularizer/SumSum'Policy_Head/bias/Regularizer/Square:y:0+Policy_Head/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: g
"Policy_Head/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
 Policy_Head/bias/Regularizer/mulMul+Policy_Head/bias/Regularizer/mul/x:output:0)Policy_Head/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: z
IdentityIdentity+Value_Head/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������~

Identity_1Identity,Policy_Head/StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:�����������
NoOpNoOp.^Batch_Normalization_0/StatefulPartitionedCall.^Batch_Normalization_1/StatefulPartitionedCall.^Batch_Normalization_2/StatefulPartitionedCall.^Batch_Normalization_3/StatefulPartitionedCall.^Batch_Normalization_4/StatefulPartitionedCall.^Batch_Normalization_5/StatefulPartitionedCall.^Convolutional_Layer_0/StatefulPartitionedCall=^Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp.^Convolutional_Layer_1/StatefulPartitionedCall=^Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp.^Convolutional_Layer_2/StatefulPartitionedCall=^Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp.^Convolutional_Layer_3/StatefulPartitionedCall=^Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp.^Convolutional_Layer_4/StatefulPartitionedCall=^Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp.^Convolutional_Layer_5/StatefulPartitionedCall=^Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp5^Policy_Batch_Normalization_1/StatefulPartitionedCall5^Policy_Batch_Normalization_2/StatefulPartitionedCall5^Policy_Convolutional_Layer_1/StatefulPartitionedCallD^Policy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpF^Policy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp5^Policy_Convolutional_Layer_2/StatefulPartitionedCallD^Policy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpF^Policy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp$^Policy_Head/StatefulPartitionedCall3^Policy_Head/bias/Regularizer/Square/ReadVariableOp5^Policy_Head/kernel/Regularizer/Square/ReadVariableOp4^Value_Batch_Normalization_1/StatefulPartitionedCall4^Value_Batch_Normalization_2/StatefulPartitionedCall2^Value_Convolutional_Layer/StatefulPartitionedCallA^Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOpC^Value_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp*^Value_Dense_Layer/StatefulPartitionedCall9^Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp;^Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp#^Value_Head/StatefulPartitionedCall2^Value_Head/bias/Regularizer/Square/ReadVariableOp4^Value_Head/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������	�: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2^
-Batch_Normalization_0/StatefulPartitionedCall-Batch_Normalization_0/StatefulPartitionedCall2^
-Batch_Normalization_1/StatefulPartitionedCall-Batch_Normalization_1/StatefulPartitionedCall2^
-Batch_Normalization_2/StatefulPartitionedCall-Batch_Normalization_2/StatefulPartitionedCall2^
-Batch_Normalization_3/StatefulPartitionedCall-Batch_Normalization_3/StatefulPartitionedCall2^
-Batch_Normalization_4/StatefulPartitionedCall-Batch_Normalization_4/StatefulPartitionedCall2^
-Batch_Normalization_5/StatefulPartitionedCall-Batch_Normalization_5/StatefulPartitionedCall2^
-Convolutional_Layer_0/StatefulPartitionedCall-Convolutional_Layer_0/StatefulPartitionedCall2|
<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_0/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_0/kernel/Regularizer/Square/ReadVariableOp2^
-Convolutional_Layer_1/StatefulPartitionedCall-Convolutional_Layer_1/StatefulPartitionedCall2|
<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp2^
-Convolutional_Layer_2/StatefulPartitionedCall-Convolutional_Layer_2/StatefulPartitionedCall2|
<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp2^
-Convolutional_Layer_3/StatefulPartitionedCall-Convolutional_Layer_3/StatefulPartitionedCall2|
<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_3/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_3/kernel/Regularizer/Square/ReadVariableOp2^
-Convolutional_Layer_4/StatefulPartitionedCall-Convolutional_Layer_4/StatefulPartitionedCall2|
<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_4/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_4/kernel/Regularizer/Square/ReadVariableOp2^
-Convolutional_Layer_5/StatefulPartitionedCall-Convolutional_Layer_5/StatefulPartitionedCall2|
<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp2l
4Policy_Batch_Normalization_1/StatefulPartitionedCall4Policy_Batch_Normalization_1/StatefulPartitionedCall2l
4Policy_Batch_Normalization_2/StatefulPartitionedCall4Policy_Batch_Normalization_2/StatefulPartitionedCall2l
4Policy_Convolutional_Layer_1/StatefulPartitionedCall4Policy_Convolutional_Layer_1/StatefulPartitionedCall2�
CPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOpCPolicy_Convolutional_Layer_1/bias/Regularizer/Square/ReadVariableOp2�
EPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOpEPolicy_Convolutional_Layer_1/kernel/Regularizer/Square/ReadVariableOp2l
4Policy_Convolutional_Layer_2/StatefulPartitionedCall4Policy_Convolutional_Layer_2/StatefulPartitionedCall2�
CPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOpCPolicy_Convolutional_Layer_2/bias/Regularizer/Square/ReadVariableOp2�
EPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOpEPolicy_Convolutional_Layer_2/kernel/Regularizer/Square/ReadVariableOp2J
#Policy_Head/StatefulPartitionedCall#Policy_Head/StatefulPartitionedCall2h
2Policy_Head/bias/Regularizer/Square/ReadVariableOp2Policy_Head/bias/Regularizer/Square/ReadVariableOp2l
4Policy_Head/kernel/Regularizer/Square/ReadVariableOp4Policy_Head/kernel/Regularizer/Square/ReadVariableOp2j
3Value_Batch_Normalization_1/StatefulPartitionedCall3Value_Batch_Normalization_1/StatefulPartitionedCall2j
3Value_Batch_Normalization_2/StatefulPartitionedCall3Value_Batch_Normalization_2/StatefulPartitionedCall2f
1Value_Convolutional_Layer/StatefulPartitionedCall1Value_Convolutional_Layer/StatefulPartitionedCall2�
@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp2�
BValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOpBValue_Convolutional_Layer/kernel/Regularizer/Square/ReadVariableOp2V
)Value_Dense_Layer/StatefulPartitionedCall)Value_Dense_Layer/StatefulPartitionedCall2t
8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp8Value_Dense_Layer/bias/Regularizer/Square/ReadVariableOp2x
:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp:Value_Dense_Layer/kernel/Regularizer/Square/ReadVariableOp2H
"Value_Head/StatefulPartitionedCall"Value_Head/StatefulPartitionedCall2f
1Value_Head/bias/Regularizer/Square/ReadVariableOp1Value_Head/bias/Regularizer/Square/ReadVariableOp2j
3Value_Head/kernel/Regularizer/Square/ReadVariableOp3Value_Head/kernel/Regularizer/Square/ReadVariableOp:Y U
0
_output_shapes
:���������	�
!
_user_specified_name	input_2
�
�
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_6930

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identity��FusedBatchNormV3/ReadVariableOp�!FusedBatchNormV3/ReadVariableOp_1�ReadVariableOp�ReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0�
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0�
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+���������������������������:::::*
epsilon%o�:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+���������������������������: : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
4__inference_Convolutional_Layer_5_layer_call_fn_7173

inputs!
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Convolutional_Layer_5_layer_call_and_return_conditional_losses_2561w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
__inference_loss_fn_13_8212W
Ivalue_convolutional_layer_bias_regularizer_square_readvariableop_resource:
identity��@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp�
@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOpReadVariableOpIvalue_convolutional_layer_bias_regularizer_square_readvariableop_resource*
_output_shapes
:*
dtype0�
1Value_Convolutional_Layer/bias/Regularizer/SquareSquareHValue_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:z
0Value_Convolutional_Layer/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
.Value_Convolutional_Layer/bias/Regularizer/SumSum5Value_Convolutional_Layer/bias/Regularizer/Square:y:09Value_Convolutional_Layer/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: u
0Value_Convolutional_Layer/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
.Value_Convolutional_Layer/bias/Regularizer/mulMul9Value_Convolutional_Layer/bias/Regularizer/mul/x:output:07Value_Convolutional_Layer/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: p
IdentityIdentity2Value_Convolutional_Layer/bias/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOpA^Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2�
@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp@Value_Convolutional_Layer/bias/Regularizer/Square/ReadVariableOp
�
�
O__inference_Convolutional_Layer_5_layer_call_and_return_conditional_losses_2561

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp�>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������	�
>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
/Convolutional_Layer_5/kernel/Regularizer/SquareSquareFConvolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:�
.Convolutional_Layer_5/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
,Convolutional_Layer_5/kernel/Regularizer/SumSum3Convolutional_Layer_5/kernel/Regularizer/Square:y:07Convolutional_Layer_5/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: s
.Convolutional_Layer_5/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
,Convolutional_Layer_5/kernel/Regularizer/mulMul7Convolutional_Layer_5/kernel/Regularizer/mul/x:output:05Convolutional_Layer_5/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
-Convolutional_Layer_5/bias/Regularizer/SquareSquareDConvolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:v
,Convolutional_Layer_5/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
*Convolutional_Layer_5/bias/Regularizer/SumSum1Convolutional_Layer_5/bias/Regularizer/Square:y:05Convolutional_Layer_5/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: q
,Convolutional_Layer_5/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
*Convolutional_Layer_5/bias/Regularizer/mulMul5Convolutional_Layer_5/bias/Regularizer/mul/x:output:03Convolutional_Layer_5/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������	�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp=^Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp?^Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2|
<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp<Convolutional_Layer_5/bias/Regularizer/Square/ReadVariableOp2�
>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp>Convolutional_Layer_5/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
D__inference_Value_Head_layer_call_and_return_conditional_losses_8014

inputs0
matmul_readvariableop_resource:@-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�1Value_Head/bias/Regularizer/Square/ReadVariableOp�3Value_Head/kernel/Regularizer/Square/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������P
TanhTanhBiasAdd:output:0*
T0*'
_output_shapes
:����������
3Value_Head/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@*
dtype0�
$Value_Head/kernel/Regularizer/SquareSquare;Value_Head/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@t
#Value_Head/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
!Value_Head/kernel/Regularizer/SumSum(Value_Head/kernel/Regularizer/Square:y:0,Value_Head/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: h
#Value_Head/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
!Value_Head/kernel/Regularizer/mulMul,Value_Head/kernel/Regularizer/mul/x:output:0*Value_Head/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
1Value_Head/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"Value_Head/bias/Regularizer/SquareSquare9Value_Head/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:k
!Value_Head/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
Value_Head/bias/Regularizer/SumSum&Value_Head/bias/Regularizer/Square:y:0*Value_Head/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: f
!Value_Head/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
�#<�
Value_Head/bias/Regularizer/mulMul*Value_Head/bias/Regularizer/mul/x:output:0(Value_Head/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: W
IdentityIdentityTanh:y:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp2^Value_Head/bias/Regularizer/Square/ReadVariableOp4^Value_Head/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2f
1Value_Head/bias/Regularizer/Square/ReadVariableOp1Value_Head/bias/Regularizer/Square/ReadVariableOp2j
3Value_Head/kernel/Regularizer/Square/ReadVariableOp3Value_Head/kernel/Regularizer/Square/ReadVariableOp:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
�
�
4__inference_Batch_Normalization_1_layer_call_fn_6563

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_2360w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:���������	: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs"�L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*�
serving_default�
D
input_29
serving_default_input_2:0���������	�@
Policy_Head1
StatefulPartitionedCall:0����������>

Value_Head0
StatefulPartitionedCall:1���������tensorflow/serving/predict:�
�	
layer-0
layer_with_weights-0
layer-1
layer_with_weights-1
layer-2
layer_with_weights-2
layer-3
layer_with_weights-3
layer-4
layer_with_weights-4
layer-5
layer_with_weights-5
layer-6
layer_with_weights-6
layer-7
	layer_with_weights-7
	layer-8

layer_with_weights-8

layer-9
layer_with_weights-9
layer-10
layer_with_weights-10
layer-11
layer_with_weights-11
layer-12
layer_with_weights-12
layer-13
layer_with_weights-13
layer-14
layer_with_weights-14
layer-15
layer_with_weights-15
layer-16
layer-17
layer_with_weights-16
layer-18
layer_with_weights-17
layer-19
layer_with_weights-18
layer-20
layer_with_weights-19
layer-21
layer-22
layer_with_weights-20
layer-23
layer_with_weights-21
layer-24
	optimizer
loss
	variables
trainable_variables
regularization_losses
	keras_api
 
signatures
�__call__
+�&call_and_return_all_conditional_losses
�_default_save_signature"
_tf_keras_network
"
_tf_keras_input_layer
�

!kernel
"bias
#	variables
$trainable_variables
%regularization_losses
&	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
'axis
	(gamma
)beta
*moving_mean
+moving_variance
,	variables
-trainable_variables
.regularization_losses
/	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�

0kernel
1bias
2	variables
3trainable_variables
4regularization_losses
5	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
6axis
	7gamma
8beta
9moving_mean
:moving_variance
;	variables
<trainable_variables
=regularization_losses
>	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�

?kernel
@bias
A	variables
Btrainable_variables
Cregularization_losses
D	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
Eaxis
	Fgamma
Gbeta
Hmoving_mean
Imoving_variance
J	variables
Ktrainable_variables
Lregularization_losses
M	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�

Nkernel
Obias
P	variables
Qtrainable_variables
Rregularization_losses
S	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
Taxis
	Ugamma
Vbeta
Wmoving_mean
Xmoving_variance
Y	variables
Ztrainable_variables
[regularization_losses
\	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�

]kernel
^bias
_	variables
`trainable_variables
aregularization_losses
b	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
caxis
	dgamma
ebeta
fmoving_mean
gmoving_variance
h	variables
itrainable_variables
jregularization_losses
k	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�

lkernel
mbias
n	variables
otrainable_variables
pregularization_losses
q	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
raxis
	sgamma
tbeta
umoving_mean
vmoving_variance
w	variables
xtrainable_variables
yregularization_losses
z	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�

{kernel
|bias
}	variables
~trainable_variables
regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
�kernel
	�bias
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
	�axis

�gamma
	�beta
�moving_mean
�moving_variance
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
	�axis

�gamma
	�beta
�moving_mean
�moving_variance
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
�kernel
	�bias
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
�kernel
	�bias
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
	�axis

�gamma
	�beta
�moving_mean
�moving_variance
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
	�axis

�gamma
	�beta
�moving_mean
�moving_variance
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
�kernel
	�bias
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
�kernel
	�bias
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
"
	optimizer
 "
trackable_dict_wrapper
�
!0
"1
(2
)3
*4
+5
06
17
78
89
910
:11
?12
@13
F14
G15
H16
I17
N18
O19
U20
V21
W22
X23
]24
^25
d26
e27
f28
g29
l30
m31
s32
t33
u34
v35
{36
|37
�38
�39
�40
�41
�42
�43
�44
�45
�46
�47
�48
�49
�50
�51
�52
�53
�54
�55
�56
�57
�58
�59
�60
�61
�62
�63"
trackable_list_wrapper
�
!0
"1
(2
)3
04
15
76
87
?8
@9
F10
G11
N12
O13
U14
V15
]16
^17
d18
e19
l20
m21
s22
t23
{24
|25
�26
�27
�28
�29
�30
�31
�32
�33
�34
�35
�36
�37
�38
�39
�40
�41
�42
�43"
trackable_list_wrapper
�
�0
�1
�2
�3
�4
�5
�6
�7
�8
�9
�10
�11
�12
�13
�14
�15
�16
�17
�18
�19
�20
�21
�22
�23"
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
	variables
trainable_variables
regularization_losses
�__call__
�_default_save_signature
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
-
�serving_default"
signature_map
7:5�2Convolutional_Layer_0/kernel
(:&2Convolutional_Layer_0/bias
.
!0
"1"
trackable_list_wrapper
.
!0
"1"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
#	variables
$trainable_variables
%regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
):'2Batch_Normalization_0/gamma
(:&2Batch_Normalization_0/beta
1:/ (2!Batch_Normalization_0/moving_mean
5:3 (2%Batch_Normalization_0/moving_variance
<
(0
)1
*2
+3"
trackable_list_wrapper
.
(0
)1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
,	variables
-trainable_variables
.regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
6:42Convolutional_Layer_1/kernel
(:&2Convolutional_Layer_1/bias
.
00
11"
trackable_list_wrapper
.
00
11"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
2	variables
3trainable_variables
4regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
):'2Batch_Normalization_1/gamma
(:&2Batch_Normalization_1/beta
1:/ (2!Batch_Normalization_1/moving_mean
5:3 (2%Batch_Normalization_1/moving_variance
<
70
81
92
:3"
trackable_list_wrapper
.
70
81"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
;	variables
<trainable_variables
=regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
6:42Convolutional_Layer_2/kernel
(:&2Convolutional_Layer_2/bias
.
?0
@1"
trackable_list_wrapper
.
?0
@1"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
A	variables
Btrainable_variables
Cregularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
):'2Batch_Normalization_2/gamma
(:&2Batch_Normalization_2/beta
1:/ (2!Batch_Normalization_2/moving_mean
5:3 (2%Batch_Normalization_2/moving_variance
<
F0
G1
H2
I3"
trackable_list_wrapper
.
F0
G1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
J	variables
Ktrainable_variables
Lregularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
6:42Convolutional_Layer_3/kernel
(:&2Convolutional_Layer_3/bias
.
N0
O1"
trackable_list_wrapper
.
N0
O1"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
P	variables
Qtrainable_variables
Rregularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
):'2Batch_Normalization_3/gamma
(:&2Batch_Normalization_3/beta
1:/ (2!Batch_Normalization_3/moving_mean
5:3 (2%Batch_Normalization_3/moving_variance
<
U0
V1
W2
X3"
trackable_list_wrapper
.
U0
V1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
Y	variables
Ztrainable_variables
[regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
6:42Convolutional_Layer_4/kernel
(:&2Convolutional_Layer_4/bias
.
]0
^1"
trackable_list_wrapper
.
]0
^1"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
_	variables
`trainable_variables
aregularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
):'2Batch_Normalization_4/gamma
(:&2Batch_Normalization_4/beta
1:/ (2!Batch_Normalization_4/moving_mean
5:3 (2%Batch_Normalization_4/moving_variance
<
d0
e1
f2
g3"
trackable_list_wrapper
.
d0
e1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
h	variables
itrainable_variables
jregularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
6:42Convolutional_Layer_5/kernel
(:&2Convolutional_Layer_5/bias
.
l0
m1"
trackable_list_wrapper
.
l0
m1"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
n	variables
otrainable_variables
pregularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
):'2Batch_Normalization_5/gamma
(:&2Batch_Normalization_5/beta
1:/ (2!Batch_Normalization_5/moving_mean
5:3 (2%Batch_Normalization_5/moving_variance
<
s0
t1
u2
v3"
trackable_list_wrapper
.
s0
t1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
w	variables
xtrainable_variables
yregularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
::82 Value_Convolutional_Layer/kernel
,:*2Value_Convolutional_Layer/bias
.
{0
|1"
trackable_list_wrapper
.
{0
|1"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
}	variables
~trainable_variables
regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
=:;2#Policy_Convolutional_Layer_1/kernel
/:-2!Policy_Convolutional_Layer_1/bias
0
�0
�1"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
/:-2!Value_Batch_Normalization_1/gamma
.:,2 Value_Batch_Normalization_1/beta
7:5 (2'Value_Batch_Normalization_1/moving_mean
;:9 (2+Value_Batch_Normalization_1/moving_variance
@
�0
�1
�2
�3"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
0:.2"Policy_Batch_Normalization_1/gamma
/:-2!Policy_Batch_Normalization_1/beta
8:6 (2(Policy_Batch_Normalization_1/moving_mean
<:: (2,Policy_Batch_Normalization_1/moving_variance
@
�0
�1
�2
�3"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
=:;2#Policy_Convolutional_Layer_2/kernel
/:-2!Policy_Convolutional_Layer_2/bias
0
�0
�1"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
*:(?@2Value_Dense_Layer/kernel
$:"@2Value_Dense_Layer/bias
0
�0
�1"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
0:.2"Policy_Batch_Normalization_2/gamma
/:-2!Policy_Batch_Normalization_2/beta
8:6 (2(Policy_Batch_Normalization_2/moving_mean
<:: (2,Policy_Batch_Normalization_2/moving_variance
@
�0
�1
�2
�3"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
/:-@2!Value_Batch_Normalization_2/gamma
.:,@2 Value_Batch_Normalization_2/beta
7:5@ (2'Value_Batch_Normalization_2/moving_mean
;:9@ (2+Value_Batch_Normalization_2/moving_variance
@
�0
�1
�2
�3"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
#:!@2Value_Head/kernel
:2Value_Head/bias
0
�0
�1"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
%:#	?�2Policy_Head/kernel
:�2Policy_Head/bias
0
�0
�1"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
�
*0
+1
92
:3
H4
I5
W6
X7
f8
g9
u10
v11
�12
�13
�14
�15
�16
�17
�18
�19"
trackable_list_wrapper
�
0
1
2
3
4
5
6
7
	8

9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24"
trackable_list_wrapper
8
�0
�1
�2"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_dict_wrapper
.
*0
+1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_dict_wrapper
.
90
:1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_dict_wrapper
.
H0
I1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_dict_wrapper
.
W0
X1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_dict_wrapper
.
f0
g1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_dict_wrapper
.
u0
v1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_dict_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_dict_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_dict_wrapper
R

�total

�count
�	variables
�	keras_api"
_tf_keras_metric
R

�total

�count
�	variables
�	keras_api"
_tf_keras_metric
R

�total

�count
�	variables
�	keras_api"
_tf_keras_metric
:  (2total
:  (2count
0
�0
�1"
trackable_list_wrapper
.
�	variables"
_generic_user_object
:  (2total
:  (2count
0
�0
�1"
trackable_list_wrapper
.
�	variables"
_generic_user_object
:  (2total
:  (2count
0
�0
�1"
trackable_list_wrapper
.
�	variables"
_generic_user_object
�2�
&__inference_model_1_layer_call_fn_3153
&__inference_model_1_layer_call_fn_5405
&__inference_model_1_layer_call_fn_5540
&__inference_model_1_layer_call_fn_4387�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
A__inference_model_1_layer_call_and_return_conditional_losses_5919
A__inference_model_1_layer_call_and_return_conditional_losses_6312
A__inference_model_1_layer_call_and_return_conditional_losses_4688
A__inference_model_1_layer_call_and_return_conditional_losses_4989�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�B�
__inference__wrapped_model_1593input_2"�
���
FullArgSpec
args� 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
4__inference_Convolutional_Layer_0_layer_call_fn_6333�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
O__inference_Convolutional_Layer_0_layer_call_and_return_conditional_losses_6356�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
4__inference_Batch_Normalization_0_layer_call_fn_6369
4__inference_Batch_Normalization_0_layer_call_fn_6382
4__inference_Batch_Normalization_0_layer_call_fn_6395
4__inference_Batch_Normalization_0_layer_call_fn_6408�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_6426
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_6444
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_6462
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_6480�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
4__inference_Convolutional_Layer_1_layer_call_fn_6501�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
O__inference_Convolutional_Layer_1_layer_call_and_return_conditional_losses_6524�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
4__inference_Batch_Normalization_1_layer_call_fn_6537
4__inference_Batch_Normalization_1_layer_call_fn_6550
4__inference_Batch_Normalization_1_layer_call_fn_6563
4__inference_Batch_Normalization_1_layer_call_fn_6576�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_6594
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_6612
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_6630
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_6648�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
4__inference_Convolutional_Layer_2_layer_call_fn_6669�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
O__inference_Convolutional_Layer_2_layer_call_and_return_conditional_losses_6692�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
4__inference_Batch_Normalization_2_layer_call_fn_6705
4__inference_Batch_Normalization_2_layer_call_fn_6718
4__inference_Batch_Normalization_2_layer_call_fn_6731
4__inference_Batch_Normalization_2_layer_call_fn_6744�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_6762
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_6780
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_6798
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_6816�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
4__inference_Convolutional_Layer_3_layer_call_fn_6837�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
O__inference_Convolutional_Layer_3_layer_call_and_return_conditional_losses_6860�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
4__inference_Batch_Normalization_3_layer_call_fn_6873
4__inference_Batch_Normalization_3_layer_call_fn_6886
4__inference_Batch_Normalization_3_layer_call_fn_6899
4__inference_Batch_Normalization_3_layer_call_fn_6912�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_6930
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_6948
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_6966
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_6984�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
4__inference_Convolutional_Layer_4_layer_call_fn_7005�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
O__inference_Convolutional_Layer_4_layer_call_and_return_conditional_losses_7028�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
4__inference_Batch_Normalization_4_layer_call_fn_7041
4__inference_Batch_Normalization_4_layer_call_fn_7054
4__inference_Batch_Normalization_4_layer_call_fn_7067
4__inference_Batch_Normalization_4_layer_call_fn_7080�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_7098
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_7116
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_7134
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_7152�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
4__inference_Convolutional_Layer_5_layer_call_fn_7173�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
O__inference_Convolutional_Layer_5_layer_call_and_return_conditional_losses_7196�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
4__inference_Batch_Normalization_5_layer_call_fn_7209
4__inference_Batch_Normalization_5_layer_call_fn_7222
4__inference_Batch_Normalization_5_layer_call_fn_7235
4__inference_Batch_Normalization_5_layer_call_fn_7248�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_7266
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_7284
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_7302
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_7320�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
8__inference_Value_Convolutional_Layer_layer_call_fn_7341�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
S__inference_Value_Convolutional_Layer_layer_call_and_return_conditional_losses_7364�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
;__inference_Policy_Convolutional_Layer_1_layer_call_fn_7385�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
V__inference_Policy_Convolutional_Layer_1_layer_call_and_return_conditional_losses_7408�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
:__inference_Value_Batch_Normalization_1_layer_call_fn_7421
:__inference_Value_Batch_Normalization_1_layer_call_fn_7434
:__inference_Value_Batch_Normalization_1_layer_call_fn_7447
:__inference_Value_Batch_Normalization_1_layer_call_fn_7460�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_7478
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_7496
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_7514
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_7532�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
;__inference_Policy_Batch_Normalization_1_layer_call_fn_7545
;__inference_Policy_Batch_Normalization_1_layer_call_fn_7558
;__inference_Policy_Batch_Normalization_1_layer_call_fn_7571
;__inference_Policy_Batch_Normalization_1_layer_call_fn_7584�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_7602
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_7620
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_7638
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_7656�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
2__inference_Value_Flatten_Layer_layer_call_fn_7661�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
M__inference_Value_Flatten_Layer_layer_call_and_return_conditional_losses_7667�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
;__inference_Policy_Convolutional_Layer_2_layer_call_fn_7688�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
V__inference_Policy_Convolutional_Layer_2_layer_call_and_return_conditional_losses_7711�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
0__inference_Value_Dense_Layer_layer_call_fn_7732�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
K__inference_Value_Dense_Layer_layer_call_and_return_conditional_losses_7755�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
;__inference_Policy_Batch_Normalization_2_layer_call_fn_7768
;__inference_Policy_Batch_Normalization_2_layer_call_fn_7781
;__inference_Policy_Batch_Normalization_2_layer_call_fn_7794
;__inference_Policy_Batch_Normalization_2_layer_call_fn_7807�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_7825
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_7843
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_7861
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_7879�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
:__inference_Value_Batch_Normalization_2_layer_call_fn_7892
:__inference_Value_Batch_Normalization_2_layer_call_fn_7905�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
U__inference_Value_Batch_Normalization_2_layer_call_and_return_conditional_losses_7925
U__inference_Value_Batch_Normalization_2_layer_call_and_return_conditional_losses_7959�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
3__inference_Policy_Flatten_Layer_layer_call_fn_7964�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
N__inference_Policy_Flatten_Layer_layer_call_and_return_conditional_losses_7970�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
)__inference_Value_Head_layer_call_fn_7991�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
D__inference_Value_Head_layer_call_and_return_conditional_losses_8014�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
*__inference_Policy_Head_layer_call_fn_8035�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
E__inference_Policy_Head_layer_call_and_return_conditional_losses_8058�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
__inference_loss_fn_0_8069�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_1_8080�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_2_8091�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_3_8102�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_4_8113�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_5_8124�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_6_8135�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_7_8146�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_8_8157�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_9_8168�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_10_8179�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_11_8190�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_12_8201�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_13_8212�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_14_8223�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_15_8234�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_16_8245�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_17_8256�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_18_8267�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_19_8278�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_20_8289�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_21_8300�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_22_8311�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_23_8322�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�B�
"__inference_signature_wrapper_5270input_2"�
���
FullArgSpec
args� 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 �
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_6426�()*+M�J
C�@
:�7
inputs+���������������������������
p 
� "?�<
5�2
0+���������������������������
� �
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_6444�()*+M�J
C�@
:�7
inputs+���������������������������
p
� "?�<
5�2
0+���������������������������
� �
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_6462r()*+;�8
1�.
(�%
inputs���������	
p 
� "-�*
#� 
0���������	
� �
O__inference_Batch_Normalization_0_layer_call_and_return_conditional_losses_6480r()*+;�8
1�.
(�%
inputs���������	
p
� "-�*
#� 
0���������	
� �
4__inference_Batch_Normalization_0_layer_call_fn_6369�()*+M�J
C�@
:�7
inputs+���������������������������
p 
� "2�/+����������������������������
4__inference_Batch_Normalization_0_layer_call_fn_6382�()*+M�J
C�@
:�7
inputs+���������������������������
p
� "2�/+����������������������������
4__inference_Batch_Normalization_0_layer_call_fn_6395e()*+;�8
1�.
(�%
inputs���������	
p 
� " ����������	�
4__inference_Batch_Normalization_0_layer_call_fn_6408e()*+;�8
1�.
(�%
inputs���������	
p
� " ����������	�
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_6594�789:M�J
C�@
:�7
inputs+���������������������������
p 
� "?�<
5�2
0+���������������������������
� �
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_6612�789:M�J
C�@
:�7
inputs+���������������������������
p
� "?�<
5�2
0+���������������������������
� �
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_6630r789:;�8
1�.
(�%
inputs���������	
p 
� "-�*
#� 
0���������	
� �
O__inference_Batch_Normalization_1_layer_call_and_return_conditional_losses_6648r789:;�8
1�.
(�%
inputs���������	
p
� "-�*
#� 
0���������	
� �
4__inference_Batch_Normalization_1_layer_call_fn_6537�789:M�J
C�@
:�7
inputs+���������������������������
p 
� "2�/+����������������������������
4__inference_Batch_Normalization_1_layer_call_fn_6550�789:M�J
C�@
:�7
inputs+���������������������������
p
� "2�/+����������������������������
4__inference_Batch_Normalization_1_layer_call_fn_6563e789:;�8
1�.
(�%
inputs���������	
p 
� " ����������	�
4__inference_Batch_Normalization_1_layer_call_fn_6576e789:;�8
1�.
(�%
inputs���������	
p
� " ����������	�
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_6762�FGHIM�J
C�@
:�7
inputs+���������������������������
p 
� "?�<
5�2
0+���������������������������
� �
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_6780�FGHIM�J
C�@
:�7
inputs+���������������������������
p
� "?�<
5�2
0+���������������������������
� �
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_6798rFGHI;�8
1�.
(�%
inputs���������	
p 
� "-�*
#� 
0���������	
� �
O__inference_Batch_Normalization_2_layer_call_and_return_conditional_losses_6816rFGHI;�8
1�.
(�%
inputs���������	
p
� "-�*
#� 
0���������	
� �
4__inference_Batch_Normalization_2_layer_call_fn_6705�FGHIM�J
C�@
:�7
inputs+���������������������������
p 
� "2�/+����������������������������
4__inference_Batch_Normalization_2_layer_call_fn_6718�FGHIM�J
C�@
:�7
inputs+���������������������������
p
� "2�/+����������������������������
4__inference_Batch_Normalization_2_layer_call_fn_6731eFGHI;�8
1�.
(�%
inputs���������	
p 
� " ����������	�
4__inference_Batch_Normalization_2_layer_call_fn_6744eFGHI;�8
1�.
(�%
inputs���������	
p
� " ����������	�
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_6930�UVWXM�J
C�@
:�7
inputs+���������������������������
p 
� "?�<
5�2
0+���������������������������
� �
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_6948�UVWXM�J
C�@
:�7
inputs+���������������������������
p
� "?�<
5�2
0+���������������������������
� �
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_6966rUVWX;�8
1�.
(�%
inputs���������	
p 
� "-�*
#� 
0���������	
� �
O__inference_Batch_Normalization_3_layer_call_and_return_conditional_losses_6984rUVWX;�8
1�.
(�%
inputs���������	
p
� "-�*
#� 
0���������	
� �
4__inference_Batch_Normalization_3_layer_call_fn_6873�UVWXM�J
C�@
:�7
inputs+���������������������������
p 
� "2�/+����������������������������
4__inference_Batch_Normalization_3_layer_call_fn_6886�UVWXM�J
C�@
:�7
inputs+���������������������������
p
� "2�/+����������������������������
4__inference_Batch_Normalization_3_layer_call_fn_6899eUVWX;�8
1�.
(�%
inputs���������	
p 
� " ����������	�
4__inference_Batch_Normalization_3_layer_call_fn_6912eUVWX;�8
1�.
(�%
inputs���������	
p
� " ����������	�
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_7098�defgM�J
C�@
:�7
inputs+���������������������������
p 
� "?�<
5�2
0+���������������������������
� �
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_7116�defgM�J
C�@
:�7
inputs+���������������������������
p
� "?�<
5�2
0+���������������������������
� �
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_7134rdefg;�8
1�.
(�%
inputs���������	
p 
� "-�*
#� 
0���������	
� �
O__inference_Batch_Normalization_4_layer_call_and_return_conditional_losses_7152rdefg;�8
1�.
(�%
inputs���������	
p
� "-�*
#� 
0���������	
� �
4__inference_Batch_Normalization_4_layer_call_fn_7041�defgM�J
C�@
:�7
inputs+���������������������������
p 
� "2�/+����������������������������
4__inference_Batch_Normalization_4_layer_call_fn_7054�defgM�J
C�@
:�7
inputs+���������������������������
p
� "2�/+����������������������������
4__inference_Batch_Normalization_4_layer_call_fn_7067edefg;�8
1�.
(�%
inputs���������	
p 
� " ����������	�
4__inference_Batch_Normalization_4_layer_call_fn_7080edefg;�8
1�.
(�%
inputs���������	
p
� " ����������	�
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_7266�stuvM�J
C�@
:�7
inputs+���������������������������
p 
� "?�<
5�2
0+���������������������������
� �
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_7284�stuvM�J
C�@
:�7
inputs+���������������������������
p
� "?�<
5�2
0+���������������������������
� �
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_7302rstuv;�8
1�.
(�%
inputs���������	
p 
� "-�*
#� 
0���������	
� �
O__inference_Batch_Normalization_5_layer_call_and_return_conditional_losses_7320rstuv;�8
1�.
(�%
inputs���������	
p
� "-�*
#� 
0���������	
� �
4__inference_Batch_Normalization_5_layer_call_fn_7209�stuvM�J
C�@
:�7
inputs+���������������������������
p 
� "2�/+����������������������������
4__inference_Batch_Normalization_5_layer_call_fn_7222�stuvM�J
C�@
:�7
inputs+���������������������������
p
� "2�/+����������������������������
4__inference_Batch_Normalization_5_layer_call_fn_7235estuv;�8
1�.
(�%
inputs���������	
p 
� " ����������	�
4__inference_Batch_Normalization_5_layer_call_fn_7248estuv;�8
1�.
(�%
inputs���������	
p
� " ����������	�
O__inference_Convolutional_Layer_0_layer_call_and_return_conditional_losses_6356m!"8�5
.�+
)�&
inputs���������	�
� "-�*
#� 
0���������	
� �
4__inference_Convolutional_Layer_0_layer_call_fn_6333`!"8�5
.�+
)�&
inputs���������	�
� " ����������	�
O__inference_Convolutional_Layer_1_layer_call_and_return_conditional_losses_6524l017�4
-�*
(�%
inputs���������	
� "-�*
#� 
0���������	
� �
4__inference_Convolutional_Layer_1_layer_call_fn_6501_017�4
-�*
(�%
inputs���������	
� " ����������	�
O__inference_Convolutional_Layer_2_layer_call_and_return_conditional_losses_6692l?@7�4
-�*
(�%
inputs���������	
� "-�*
#� 
0���������	
� �
4__inference_Convolutional_Layer_2_layer_call_fn_6669_?@7�4
-�*
(�%
inputs���������	
� " ����������	�
O__inference_Convolutional_Layer_3_layer_call_and_return_conditional_losses_6860lNO7�4
-�*
(�%
inputs���������	
� "-�*
#� 
0���������	
� �
4__inference_Convolutional_Layer_3_layer_call_fn_6837_NO7�4
-�*
(�%
inputs���������	
� " ����������	�
O__inference_Convolutional_Layer_4_layer_call_and_return_conditional_losses_7028l]^7�4
-�*
(�%
inputs���������	
� "-�*
#� 
0���������	
� �
4__inference_Convolutional_Layer_4_layer_call_fn_7005_]^7�4
-�*
(�%
inputs���������	
� " ����������	�
O__inference_Convolutional_Layer_5_layer_call_and_return_conditional_losses_7196llm7�4
-�*
(�%
inputs���������	
� "-�*
#� 
0���������	
� �
4__inference_Convolutional_Layer_5_layer_call_fn_7173_lm7�4
-�*
(�%
inputs���������	
� " ����������	�
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_7602�����M�J
C�@
:�7
inputs+���������������������������
p 
� "?�<
5�2
0+���������������������������
� �
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_7620�����M�J
C�@
:�7
inputs+���������������������������
p
� "?�<
5�2
0+���������������������������
� �
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_7638v����;�8
1�.
(�%
inputs���������	
p 
� "-�*
#� 
0���������	
� �
V__inference_Policy_Batch_Normalization_1_layer_call_and_return_conditional_losses_7656v����;�8
1�.
(�%
inputs���������	
p
� "-�*
#� 
0���������	
� �
;__inference_Policy_Batch_Normalization_1_layer_call_fn_7545�����M�J
C�@
:�7
inputs+���������������������������
p 
� "2�/+����������������������������
;__inference_Policy_Batch_Normalization_1_layer_call_fn_7558�����M�J
C�@
:�7
inputs+���������������������������
p
� "2�/+����������������������������
;__inference_Policy_Batch_Normalization_1_layer_call_fn_7571i����;�8
1�.
(�%
inputs���������	
p 
� " ����������	�
;__inference_Policy_Batch_Normalization_1_layer_call_fn_7584i����;�8
1�.
(�%
inputs���������	
p
� " ����������	�
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_7825�����M�J
C�@
:�7
inputs+���������������������������
p 
� "?�<
5�2
0+���������������������������
� �
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_7843�����M�J
C�@
:�7
inputs+���������������������������
p
� "?�<
5�2
0+���������������������������
� �
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_7861v����;�8
1�.
(�%
inputs���������	
p 
� "-�*
#� 
0���������	
� �
V__inference_Policy_Batch_Normalization_2_layer_call_and_return_conditional_losses_7879v����;�8
1�.
(�%
inputs���������	
p
� "-�*
#� 
0���������	
� �
;__inference_Policy_Batch_Normalization_2_layer_call_fn_7768�����M�J
C�@
:�7
inputs+���������������������������
p 
� "2�/+����������������������������
;__inference_Policy_Batch_Normalization_2_layer_call_fn_7781�����M�J
C�@
:�7
inputs+���������������������������
p
� "2�/+����������������������������
;__inference_Policy_Batch_Normalization_2_layer_call_fn_7794i����;�8
1�.
(�%
inputs���������	
p 
� " ����������	�
;__inference_Policy_Batch_Normalization_2_layer_call_fn_7807i����;�8
1�.
(�%
inputs���������	
p
� " ����������	�
V__inference_Policy_Convolutional_Layer_1_layer_call_and_return_conditional_losses_7408n��7�4
-�*
(�%
inputs���������	
� "-�*
#� 
0���������	
� �
;__inference_Policy_Convolutional_Layer_1_layer_call_fn_7385a��7�4
-�*
(�%
inputs���������	
� " ����������	�
V__inference_Policy_Convolutional_Layer_2_layer_call_and_return_conditional_losses_7711n��7�4
-�*
(�%
inputs���������	
� "-�*
#� 
0���������	
� �
;__inference_Policy_Convolutional_Layer_2_layer_call_fn_7688a��7�4
-�*
(�%
inputs���������	
� " ����������	�
N__inference_Policy_Flatten_Layer_layer_call_and_return_conditional_losses_7970`7�4
-�*
(�%
inputs���������	
� "%�"
�
0���������?
� �
3__inference_Policy_Flatten_Layer_layer_call_fn_7964S7�4
-�*
(�%
inputs���������	
� "����������?�
E__inference_Policy_Head_layer_call_and_return_conditional_losses_8058_��/�,
%�"
 �
inputs���������?
� "&�#
�
0����������
� �
*__inference_Policy_Head_layer_call_fn_8035R��/�,
%�"
 �
inputs���������?
� "������������
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_7478�����M�J
C�@
:�7
inputs+���������������������������
p 
� "?�<
5�2
0+���������������������������
� �
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_7496�����M�J
C�@
:�7
inputs+���������������������������
p
� "?�<
5�2
0+���������������������������
� �
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_7514v����;�8
1�.
(�%
inputs���������	
p 
� "-�*
#� 
0���������	
� �
U__inference_Value_Batch_Normalization_1_layer_call_and_return_conditional_losses_7532v����;�8
1�.
(�%
inputs���������	
p
� "-�*
#� 
0���������	
� �
:__inference_Value_Batch_Normalization_1_layer_call_fn_7421�����M�J
C�@
:�7
inputs+���������������������������
p 
� "2�/+����������������������������
:__inference_Value_Batch_Normalization_1_layer_call_fn_7434�����M�J
C�@
:�7
inputs+���������������������������
p
� "2�/+����������������������������
:__inference_Value_Batch_Normalization_1_layer_call_fn_7447i����;�8
1�.
(�%
inputs���������	
p 
� " ����������	�
:__inference_Value_Batch_Normalization_1_layer_call_fn_7460i����;�8
1�.
(�%
inputs���������	
p
� " ����������	�
U__inference_Value_Batch_Normalization_2_layer_call_and_return_conditional_losses_7925f����3�0
)�&
 �
inputs���������@
p 
� "%�"
�
0���������@
� �
U__inference_Value_Batch_Normalization_2_layer_call_and_return_conditional_losses_7959f����3�0
)�&
 �
inputs���������@
p
� "%�"
�
0���������@
� �
:__inference_Value_Batch_Normalization_2_layer_call_fn_7892Y����3�0
)�&
 �
inputs���������@
p 
� "����������@�
:__inference_Value_Batch_Normalization_2_layer_call_fn_7905Y����3�0
)�&
 �
inputs���������@
p
� "����������@�
S__inference_Value_Convolutional_Layer_layer_call_and_return_conditional_losses_7364l{|7�4
-�*
(�%
inputs���������	
� "-�*
#� 
0���������	
� �
8__inference_Value_Convolutional_Layer_layer_call_fn_7341_{|7�4
-�*
(�%
inputs���������	
� " ����������	�
K__inference_Value_Dense_Layer_layer_call_and_return_conditional_losses_7755^��/�,
%�"
 �
inputs���������?
� "%�"
�
0���������@
� �
0__inference_Value_Dense_Layer_layer_call_fn_7732Q��/�,
%�"
 �
inputs���������?
� "����������@�
M__inference_Value_Flatten_Layer_layer_call_and_return_conditional_losses_7667`7�4
-�*
(�%
inputs���������	
� "%�"
�
0���������?
� �
2__inference_Value_Flatten_Layer_layer_call_fn_7661S7�4
-�*
(�%
inputs���������	
� "����������?�
D__inference_Value_Head_layer_call_and_return_conditional_losses_8014^��/�,
%�"
 �
inputs���������@
� "%�"
�
0���������
� ~
)__inference_Value_Head_layer_call_fn_7991Q��/�,
%�"
 �
inputs���������@
� "�����������
__inference__wrapped_model_1593�Z!"()*+01789:?@FGHINOUVWX]^defglmstuv��{|������������������������9�6
/�,
*�'
input_2���������	�
� "n�k
5
Policy_Head&�#
Policy_Head����������
2

Value_Head$�!

Value_Head���������9
__inference_loss_fn_0_8069!�

� 
� "� :
__inference_loss_fn_10_8179l�

� 
� "� :
__inference_loss_fn_11_8190m�

� 
� "� :
__inference_loss_fn_12_8201{�

� 
� "� :
__inference_loss_fn_13_8212|�

� 
� "� ;
__inference_loss_fn_14_8223��

� 
� "� ;
__inference_loss_fn_15_8234��

� 
� "� ;
__inference_loss_fn_16_8245��

� 
� "� ;
__inference_loss_fn_17_8256��

� 
� "� ;
__inference_loss_fn_18_8267��

� 
� "� ;
__inference_loss_fn_19_8278��

� 
� "� 9
__inference_loss_fn_1_8080"�

� 
� "� ;
__inference_loss_fn_20_8289��

� 
� "� ;
__inference_loss_fn_21_8300��

� 
� "� ;
__inference_loss_fn_22_8311��

� 
� "� ;
__inference_loss_fn_23_8322��

� 
� "� 9
__inference_loss_fn_2_80910�

� 
� "� 9
__inference_loss_fn_3_81021�

� 
� "� 9
__inference_loss_fn_4_8113?�

� 
� "� 9
__inference_loss_fn_5_8124@�

� 
� "� 9
__inference_loss_fn_6_8135N�

� 
� "� 9
__inference_loss_fn_7_8146O�

� 
� "� 9
__inference_loss_fn_8_8157]�

� 
� "� 9
__inference_loss_fn_9_8168^�

� 
� "� �
A__inference_model_1_layer_call_and_return_conditional_losses_4688�Z!"()*+01789:?@FGHINOUVWX]^defglmstuv��{|������������������������A�>
7�4
*�'
input_2���������	�
p 

 
� "L�I
B�?
�
0/0���������
�
0/1����������
� �
A__inference_model_1_layer_call_and_return_conditional_losses_4989�Z!"()*+01789:?@FGHINOUVWX]^defglmstuv��{|������������������������A�>
7�4
*�'
input_2���������	�
p

 
� "L�I
B�?
�
0/0���������
�
0/1����������
� �
A__inference_model_1_layer_call_and_return_conditional_losses_5919�Z!"()*+01789:?@FGHINOUVWX]^defglmstuv��{|������������������������@�=
6�3
)�&
inputs���������	�
p 

 
� "L�I
B�?
�
0/0���������
�
0/1����������
� �
A__inference_model_1_layer_call_and_return_conditional_losses_6312�Z!"()*+01789:?@FGHINOUVWX]^defglmstuv��{|������������������������@�=
6�3
)�&
inputs���������	�
p

 
� "L�I
B�?
�
0/0���������
�
0/1����������
� �
&__inference_model_1_layer_call_fn_3153�Z!"()*+01789:?@FGHINOUVWX]^defglmstuv��{|������������������������A�>
7�4
*�'
input_2���������	�
p 

 
� ">�;
�
0���������
�
1�����������
&__inference_model_1_layer_call_fn_4387�Z!"()*+01789:?@FGHINOUVWX]^defglmstuv��{|������������������������A�>
7�4
*�'
input_2���������	�
p

 
� ">�;
�
0���������
�
1�����������
&__inference_model_1_layer_call_fn_5405�Z!"()*+01789:?@FGHINOUVWX]^defglmstuv��{|������������������������@�=
6�3
)�&
inputs���������	�
p 

 
� ">�;
�
0���������
�
1�����������
&__inference_model_1_layer_call_fn_5540�Z!"()*+01789:?@FGHINOUVWX]^defglmstuv��{|������������������������@�=
6�3
)�&
inputs���������	�
p

 
� ">�;
�
0���������
�
1�����������
"__inference_signature_wrapper_5270�Z!"()*+01789:?@FGHINOUVWX]^defglmstuv��{|������������������������D�A
� 
:�7
5
input_2*�'
input_2���������	�"n�k
5
Policy_Head&�#
Policy_Head����������
2

Value_Head$�!

Value_Head���������