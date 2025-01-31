��
��
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( �
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
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
;
Elu
features"T
activations"T"
Ttype:
2
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
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
@
RealDiv
x"T
y"T
z"T"
Ttype:
2	
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
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
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
7
Square
x"T
y"T"
Ttype:
2	
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
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
�
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
�
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
�
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 �"serve*2.9.12v2.9.0-18-gd8ce9f9c3018��
~
Adam/dense_5/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	*$
shared_nameAdam/dense_5/bias/v
w
'Adam/dense_5/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_5/bias/v*
_output_shapes
:	*
dtype0
�
Adam/dense_5/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:2	*&
shared_nameAdam/dense_5/kernel/v

)Adam/dense_5/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_5/kernel/v*
_output_shapes

:2	*
dtype0
~
Adam/dense_4/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:2*$
shared_nameAdam/dense_4/bias/v
w
'Adam/dense_4/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_4/bias/v*
_output_shapes
:2*
dtype0
�
Adam/dense_4/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�2*&
shared_nameAdam/dense_4/kernel/v
�
)Adam/dense_4/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_4/kernel/v*
_output_shapes
:	�2*
dtype0

Adam/dense_3/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:�*$
shared_nameAdam/dense_3/bias/v
x
'Adam/dense_3/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_3/bias/v*
_output_shapes	
:�*
dtype0
�
Adam/dense_3/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
��*&
shared_nameAdam/dense_3/kernel/v
�
)Adam/dense_3/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_3/kernel/v* 
_output_shapes
:
��*
dtype0
�
Adam/conv1d_1/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*%
shared_nameAdam/conv1d_1/bias/v
y
(Adam/conv1d_1/bias/v/Read/ReadVariableOpReadVariableOpAdam/conv1d_1/bias/v*
_output_shapes
:*
dtype0
�
Adam/conv1d_1/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	*'
shared_nameAdam/conv1d_1/kernel/v
�
*Adam/conv1d_1/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv1d_1/kernel/v*"
_output_shapes
:	*
dtype0
~
Adam/dense_5/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	*$
shared_nameAdam/dense_5/bias/m
w
'Adam/dense_5/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_5/bias/m*
_output_shapes
:	*
dtype0
�
Adam/dense_5/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:2	*&
shared_nameAdam/dense_5/kernel/m

)Adam/dense_5/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_5/kernel/m*
_output_shapes

:2	*
dtype0
~
Adam/dense_4/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:2*$
shared_nameAdam/dense_4/bias/m
w
'Adam/dense_4/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_4/bias/m*
_output_shapes
:2*
dtype0
�
Adam/dense_4/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�2*&
shared_nameAdam/dense_4/kernel/m
�
)Adam/dense_4/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_4/kernel/m*
_output_shapes
:	�2*
dtype0

Adam/dense_3/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:�*$
shared_nameAdam/dense_3/bias/m
x
'Adam/dense_3/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_3/bias/m*
_output_shapes	
:�*
dtype0
�
Adam/dense_3/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
��*&
shared_nameAdam/dense_3/kernel/m
�
)Adam/dense_3/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_3/kernel/m* 
_output_shapes
:
��*
dtype0
�
Adam/conv1d_1/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*%
shared_nameAdam/conv1d_1/bias/m
y
(Adam/conv1d_1/bias/m/Read/ReadVariableOpReadVariableOpAdam/conv1d_1/bias/m*
_output_shapes
:*
dtype0
�
Adam/conv1d_1/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	*'
shared_nameAdam/conv1d_1/kernel/m
�
*Adam/conv1d_1/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv1d_1/kernel/m*"
_output_shapes
:	*
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
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
p
dense_5/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:	*
shared_namedense_5/bias
i
 dense_5/bias/Read/ReadVariableOpReadVariableOpdense_5/bias*
_output_shapes
:	*
dtype0
x
dense_5/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:2	*
shared_namedense_5/kernel
q
"dense_5/kernel/Read/ReadVariableOpReadVariableOpdense_5/kernel*
_output_shapes

:2	*
dtype0
p
dense_4/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:2*
shared_namedense_4/bias
i
 dense_4/bias/Read/ReadVariableOpReadVariableOpdense_4/bias*
_output_shapes
:2*
dtype0
y
dense_4/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�2*
shared_namedense_4/kernel
r
"dense_4/kernel/Read/ReadVariableOpReadVariableOpdense_4/kernel*
_output_shapes
:	�2*
dtype0
q
dense_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:�*
shared_namedense_3/bias
j
 dense_3/bias/Read/ReadVariableOpReadVariableOpdense_3/bias*
_output_shapes	
:�*
dtype0
z
dense_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
��*
shared_namedense_3/kernel
s
"dense_3/kernel/Read/ReadVariableOpReadVariableOpdense_3/kernel* 
_output_shapes
:
��*
dtype0
r
conv1d_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_nameconv1d_1/bias
k
!conv1d_1/bias/Read/ReadVariableOpReadVariableOpconv1d_1/bias*
_output_shapes
:*
dtype0
~
conv1d_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	* 
shared_nameconv1d_1/kernel
w
#conv1d_1/kernel/Read/ReadVariableOpReadVariableOpconv1d_1/kernel*"
_output_shapes
:	*
dtype0

NoOpNoOp
�J
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*�J
value�JB�J B�J
�
layer_with_weights-0
layer-0
layer-1
layer_with_weights-1
layer-2
layer-3
layer_with_weights-2
layer-4
layer_with_weights-3
layer-5
layer-6
	variables
	trainable_variables

regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures*
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses

kernel
bias
 _jit_compiled_convolution_op*
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses* 
�
 	variables
!trainable_variables
"regularization_losses
#	keras_api
$__call__
*%&call_and_return_all_conditional_losses

&kernel
'bias*
�
(	variables
)trainable_variables
*regularization_losses
+	keras_api
,__call__
*-&call_and_return_all_conditional_losses
._random_generator* 
�
/	variables
0trainable_variables
1regularization_losses
2	keras_api
3__call__
*4&call_and_return_all_conditional_losses

5kernel
6bias*
�
7	variables
8trainable_variables
9regularization_losses
:	keras_api
;__call__
*<&call_and_return_all_conditional_losses

=kernel
>bias*
�
?	variables
@trainable_variables
Aregularization_losses
B	keras_api
C__call__
*D&call_and_return_all_conditional_losses* 
<
0
1
&2
'3
54
65
=6
>7*
<
0
1
&2
'3
54
65
=6
>7*
%
E0
F1
G2
H3
I4* 
�
Jnon_trainable_variables

Klayers
Lmetrics
Mlayer_regularization_losses
Nlayer_metrics
	variables
	trainable_variables

regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
6
Otrace_0
Ptrace_1
Qtrace_2
Rtrace_3* 
6
Strace_0
Ttrace_1
Utrace_2
Vtrace_3* 
* 
�
Witer

Xbeta_1

Ybeta_2
	Zdecay
[learning_ratem�m�&m�'m�5m�6m�=m�>m�v�v�&v�'v�5v�6v�=v�>v�*

\serving_default* 

0
1*

0
1*

E0
F1* 
�
]non_trainable_variables

^layers
_metrics
`layer_regularization_losses
alayer_metrics
	variables
trainable_variables
regularization_losses
__call__
bactivity_regularizer_fn
*&call_and_return_all_conditional_losses
&c"call_and_return_conditional_losses*

dtrace_0* 

etrace_0* 
_Y
VARIABLE_VALUEconv1d_1/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE*
[U
VARIABLE_VALUEconv1d_1/bias4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
�
fnon_trainable_variables

glayers
hmetrics
ilayer_regularization_losses
jlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses* 

ktrace_0* 

ltrace_0* 

&0
'1*

&0
'1*
	
G0* 
�
mnon_trainable_variables

nlayers
ometrics
player_regularization_losses
qlayer_metrics
 	variables
!trainable_variables
"regularization_losses
$__call__
ractivity_regularizer_fn
*%&call_and_return_all_conditional_losses
&s"call_and_return_conditional_losses*

ttrace_0* 

utrace_0* 
^X
VARIABLE_VALUEdense_3/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUEdense_3/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
�
vnon_trainable_variables

wlayers
xmetrics
ylayer_regularization_losses
zlayer_metrics
(	variables
)trainable_variables
*regularization_losses
,__call__
*-&call_and_return_all_conditional_losses
&-"call_and_return_conditional_losses* 

{trace_0
|trace_1* 

}trace_0
~trace_1* 
* 

50
61*

50
61*
	
H0* 
�
non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
/	variables
0trainable_variables
1regularization_losses
3__call__
�activity_regularizer_fn
*4&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
^X
VARIABLE_VALUEdense_4/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUEdense_4/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE*

=0
>1*

=0
>1*
	
I0* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
7	variables
8trainable_variables
9regularization_losses
;__call__
�activity_regularizer_fn
*<&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
^X
VARIABLE_VALUEdense_5/kernel6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUEdense_5/bias4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
?	variables
@trainable_variables
Aregularization_losses
C__call__
*D&call_and_return_all_conditional_losses
&D"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 

�trace_0* 

�trace_0* 

�trace_0* 

�trace_0* 

�trace_0* 
* 
5
0
1
2
3
4
5
6*

�0
�1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
LF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE*
NH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE*
^X
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 

E0
F1* 
* 

�trace_0* 

�trace_0* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
	
G0* 
* 

�trace_0* 

�trace_0* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
	
H0* 
* 

�trace_0* 

�trace_0* 
* 
* 
* 
* 
* 
	
I0* 
* 

�trace_0* 

�trace_0* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
<
�	variables
�	keras_api

�total

�count*
M
�	variables
�	keras_api

�total

�count
�
_fn_kwargs*
* 
* 
* 
* 
* 
* 
* 
* 

�0
�1*

�	variables*
UO
VARIABLE_VALUEtotal_14keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE*
UO
VARIABLE_VALUEcount_14keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE*

�0
�1*

�	variables*
SM
VARIABLE_VALUEtotal4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEcount4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE*
* 
�|
VARIABLE_VALUEAdam/conv1d_1/kernel/mRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
~x
VARIABLE_VALUEAdam/conv1d_1/bias/mPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
�{
VARIABLE_VALUEAdam/dense_3/kernel/mRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUEAdam/dense_3/bias/mPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
�{
VARIABLE_VALUEAdam/dense_4/kernel/mRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUEAdam/dense_4/bias/mPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
�{
VARIABLE_VALUEAdam/dense_5/kernel/mRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUEAdam/dense_5/bias/mPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
�|
VARIABLE_VALUEAdam/conv1d_1/kernel/vRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
~x
VARIABLE_VALUEAdam/conv1d_1/bias/vPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
�{
VARIABLE_VALUEAdam/dense_3/kernel/vRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUEAdam/dense_3/bias/vPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
�{
VARIABLE_VALUEAdam/dense_4/kernel/vRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUEAdam/dense_4/bias/vPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
�{
VARIABLE_VALUEAdam/dense_5/kernel/vRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUEAdam/dense_5/bias/vPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
�
serving_default_conv1d_1_inputPlaceholder*+
_output_shapes
:���������	*
dtype0* 
shape:���������	
�
StatefulPartitionedCallStatefulPartitionedCallserving_default_conv1d_1_inputconv1d_1/kernelconv1d_1/biasdense_3/kerneldense_3/biasdense_4/kerneldense_4/biasdense_5/kerneldense_5/bias*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������	**
_read_only_resource_inputs

*8
config_proto(&

CPU

GPU2*0J

 �AE8� */
f*R(
&__inference_signature_wrapper_17903089
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
�
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename#conv1d_1/kernel/Read/ReadVariableOp!conv1d_1/bias/Read/ReadVariableOp"dense_3/kernel/Read/ReadVariableOp dense_3/bias/Read/ReadVariableOp"dense_4/kernel/Read/ReadVariableOp dense_4/bias/Read/ReadVariableOp"dense_5/kernel/Read/ReadVariableOp dense_5/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOp*Adam/conv1d_1/kernel/m/Read/ReadVariableOp(Adam/conv1d_1/bias/m/Read/ReadVariableOp)Adam/dense_3/kernel/m/Read/ReadVariableOp'Adam/dense_3/bias/m/Read/ReadVariableOp)Adam/dense_4/kernel/m/Read/ReadVariableOp'Adam/dense_4/bias/m/Read/ReadVariableOp)Adam/dense_5/kernel/m/Read/ReadVariableOp'Adam/dense_5/bias/m/Read/ReadVariableOp*Adam/conv1d_1/kernel/v/Read/ReadVariableOp(Adam/conv1d_1/bias/v/Read/ReadVariableOp)Adam/dense_3/kernel/v/Read/ReadVariableOp'Adam/dense_3/bias/v/Read/ReadVariableOp)Adam/dense_4/kernel/v/Read/ReadVariableOp'Adam/dense_4/bias/v/Read/ReadVariableOp)Adam/dense_5/kernel/v/Read/ReadVariableOp'Adam/dense_5/bias/v/Read/ReadVariableOpConst*.
Tin'
%2#	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� **
f%R#
!__inference__traced_save_17903803
�
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameconv1d_1/kernelconv1d_1/biasdense_3/kerneldense_3/biasdense_4/kerneldense_4/biasdense_5/kerneldense_5/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotal_1count_1totalcountAdam/conv1d_1/kernel/mAdam/conv1d_1/bias/mAdam/dense_3/kernel/mAdam/dense_3/bias/mAdam/dense_4/kernel/mAdam/dense_4/bias/mAdam/dense_5/kernel/mAdam/dense_5/bias/mAdam/conv1d_1/kernel/vAdam/conv1d_1/bias/vAdam/dense_3/kernel/vAdam/dense_3/bias/vAdam/dense_4/kernel/vAdam/dense_4/bias/vAdam/dense_5/kernel/vAdam/dense_5/bias/v*-
Tin&
$2"*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *-
f(R&
$__inference__traced_restore_17903912��
�
�
__inference_loss_fn_1_17903648F
8conv1d_1_bias_regularizer_square_readvariableop_resource:
identity��/conv1d_1/bias/Regularizer/Square/ReadVariableOp�
/conv1d_1/bias/Regularizer/Square/ReadVariableOpReadVariableOp8conv1d_1_bias_regularizer_square_readvariableop_resource*
_output_shapes
:*
dtype0�
 conv1d_1/bias/Regularizer/SquareSquare7conv1d_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:i
conv1d_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
conv1d_1/bias/Regularizer/SumSum$conv1d_1/bias/Regularizer/Square:y:0(conv1d_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: d
conv1d_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
conv1d_1/bias/Regularizer/mulMul(conv1d_1/bias/Regularizer/mul/x:output:0&conv1d_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: _
IdentityIdentity!conv1d_1/bias/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: x
NoOpNoOp0^conv1d_1/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2b
/conv1d_1/bias/Regularizer/Square/ReadVariableOp/conv1d_1/bias/Regularizer/Square/ReadVariableOp
�

�
__inference_loss_fn_4_17903681E
7dense_5_bias_regularizer_square_readvariableop_resource:	
identity��.dense_5/bias/Regularizer/Square/ReadVariableOp�
.dense_5/bias/Regularizer/Square/ReadVariableOpReadVariableOp7dense_5_bias_regularizer_square_readvariableop_resource*
_output_shapes
:	*
dtype0�
dense_5/bias/Regularizer/SquareSquare6dense_5/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	h
dense_5/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_5/bias/Regularizer/SumSum#dense_5/bias/Regularizer/Square:y:0'dense_5/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_5/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_5/bias/Regularizer/mulMul'dense_5/bias/Regularizer/mul/x:output:0%dense_5/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: ^
IdentityIdentity dense_5/bias/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: w
NoOpNoOp/^dense_5/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2`
.dense_5/bias/Regularizer/Square/ReadVariableOp.dense_5/bias/Regularizer/Square/ReadVariableOp
�
�
+__inference_conv1d_1_layer_call_fn_17903429

inputs
unknown:	
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *O
fJRH
F__inference_conv1d_1_layer_call_and_return_conditional_losses_17902367s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	: : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:���������	
 
_user_specified_nameinputs
�
H
1__inference_dense_5_activity_regularizer_17902332
x
identity6
SquareSquarex*
T0*
_output_shapes
:9
RankRank
Square:y:0*
T0*
_output_shapes
: M
range/startConst*
_output_shapes
: *
dtype0*
value	B : M
range/deltaConst*
_output_shapes
: *
dtype0*
value	B :n
rangeRangerange/start:output:0Rank:output:0range/delta:output:0*#
_output_shapes
:���������G
SumSum
Square:y:0range:output:0*
T0*
_output_shapes
: J
mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    I
mulMulmul/x:output:0Sum:output:0*
T0*
_output_shapes
: >
IdentityIdentitymul:z:0*
T0*
_output_shapes
: "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
::; 7

_output_shapes
:

_user_specified_namex
�

�
__inference_loss_fn_2_17903659F
7dense_3_bias_regularizer_square_readvariableop_resource:	�
identity��.dense_3/bias/Regularizer/Square/ReadVariableOp�
.dense_3/bias/Regularizer/Square/ReadVariableOpReadVariableOp7dense_3_bias_regularizer_square_readvariableop_resource*
_output_shapes	
:�*
dtype0�
dense_3/bias/Regularizer/SquareSquare6dense_3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes	
:�h
dense_3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_3/bias/Regularizer/SumSum#dense_3/bias/Regularizer/Square:y:0'dense_3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_3/bias/Regularizer/mulMul'dense_3/bias/Regularizer/mul/x:output:0%dense_3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: ^
IdentityIdentity dense_3/bias/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: w
NoOpNoOp/^dense_3/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2`
.dense_3/bias/Regularizer/Square/ReadVariableOp.dense_3/bias/Regularizer/Square/ReadVariableOp
�
e
G__inference_dropout_1_layer_call_and_return_conditional_losses_17903531

inputs

identity_1O
IdentityIdentityinputs*
T0*(
_output_shapes
:����������\

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:����������"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
*__inference_dense_5_layer_call_fn_17903589

inputs
unknown:2	
	unknown_0:	
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������	*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *N
fIRG
E__inference_dense_5_layer_call_and_return_conditional_losses_17902474o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������2: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������2
 
_user_specified_nameinputs
�
c
G__inference_flatten_1_layer_call_and_return_conditional_losses_17903479

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"�����   ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:����������Y
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
� 
�
F__inference_conv1d_1_layer_call_and_return_conditional_losses_17903468

inputsA
+conv1d_expanddims_1_readvariableop_resource:	-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�"Conv1D/ExpandDims_1/ReadVariableOp�/conv1d_1/bias/Regularizer/Square/ReadVariableOp�1conv1d_1/kernel/Regularizer/Square/ReadVariableOp`
Conv1D/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
Conv1D/ExpandDims
ExpandDimsinputsConv1D/ExpandDims/dim:output:0*
T0*/
_output_shapes
:���������	�
"Conv1D/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:	*
dtype0Y
Conv1D/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : �
Conv1D/ExpandDims_1
ExpandDims*Conv1D/ExpandDims_1/ReadVariableOp:value:0 Conv1D/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:	�
Conv1DConv2DConv1D/ExpandDims:output:0Conv1D/ExpandDims_1:output:0*
T0*/
_output_shapes
:���������*
paddingVALID*
strides
�
Conv1D/SqueezeSqueezeConv1D:output:0*
T0*+
_output_shapes
:���������*
squeeze_dims

���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
BiasAddBiasAddConv1D/Squeeze:output:0BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������R
EluEluBiasAdd:output:0*
T0*+
_output_shapes
:����������
1conv1d_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:	*
dtype0�
"conv1d_1/kernel/Regularizer/SquareSquare9conv1d_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*"
_output_shapes
:	v
!conv1d_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*!
valueB"          �
conv1d_1/kernel/Regularizer/SumSum&conv1d_1/kernel/Regularizer/Square:y:0*conv1d_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: f
!conv1d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
conv1d_1/kernel/Regularizer/mulMul*conv1d_1/kernel/Regularizer/mul/x:output:0(conv1d_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
/conv1d_1/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
 conv1d_1/bias/Regularizer/SquareSquare7conv1d_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:i
conv1d_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
conv1d_1/bias/Regularizer/SumSum$conv1d_1/bias/Regularizer/Square:y:0(conv1d_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: d
conv1d_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
conv1d_1/bias/Regularizer/mulMul(conv1d_1/bias/Regularizer/mul/x:output:0&conv1d_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: d
IdentityIdentityElu:activations:0^NoOp*
T0*+
_output_shapes
:����������
NoOpNoOp^BiasAdd/ReadVariableOp#^Conv1D/ExpandDims_1/ReadVariableOp0^conv1d_1/bias/Regularizer/Square/ReadVariableOp2^conv1d_1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"Conv1D/ExpandDims_1/ReadVariableOp"Conv1D/ExpandDims_1/ReadVariableOp2b
/conv1d_1/bias/Regularizer/Square/ReadVariableOp/conv1d_1/bias/Regularizer/Square/ReadVariableOp2f
1conv1d_1/kernel/Regularizer/Square/ReadVariableOp1conv1d_1/kernel/Regularizer/Square/ReadVariableOp:S O
+
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
E__inference_dense_4_layer_call_and_return_conditional_losses_17903580

inputs1
matmul_readvariableop_resource:	�2-
biasadd_readvariableop_resource:2
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�.dense_4/bias/Regularizer/Square/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�2*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:2*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������2�
.dense_4/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:2*
dtype0�
dense_4/bias/Regularizer/SquareSquare6dense_4/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2h
dense_4/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_4/bias/Regularizer/SumSum#dense_4/bias/Regularizer/Square:y:0'dense_4/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_4/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_4/bias/Regularizer/mulMul'dense_4/bias/Regularizer/mul/x:output:0%dense_4/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������2�
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp/^dense_4/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2`
.dense_4/bias/Regularizer/Square/ReadVariableOp.dense_4/bias/Regularizer/Square/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
c
G__inference_flatten_1_layer_call_and_return_conditional_losses_17902387

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"�����   ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:����������Y
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
��
�	
J__inference_sequential_1_layer_call_and_return_conditional_losses_17903420

inputsJ
4conv1d_1_conv1d_expanddims_1_readvariableop_resource:	6
(conv1d_1_biasadd_readvariableop_resource::
&dense_3_matmul_readvariableop_resource:
��6
'dense_3_biasadd_readvariableop_resource:	�9
&dense_4_matmul_readvariableop_resource:	�25
'dense_4_biasadd_readvariableop_resource:28
&dense_5_matmul_readvariableop_resource:2	5
'dense_5_biasadd_readvariableop_resource:	
identity

identity_1

identity_2

identity_3

identity_4��conv1d_1/BiasAdd/ReadVariableOp�+conv1d_1/Conv1D/ExpandDims_1/ReadVariableOp�/conv1d_1/bias/Regularizer/Square/ReadVariableOp�1conv1d_1/kernel/Regularizer/Square/ReadVariableOp�dense_3/BiasAdd/ReadVariableOp�dense_3/MatMul/ReadVariableOp�.dense_3/bias/Regularizer/Square/ReadVariableOp�dense_4/BiasAdd/ReadVariableOp�dense_4/MatMul/ReadVariableOp�.dense_4/bias/Regularizer/Square/ReadVariableOp�dense_5/BiasAdd/ReadVariableOp�dense_5/MatMul/ReadVariableOp�.dense_5/bias/Regularizer/Square/ReadVariableOpi
conv1d_1/Conv1D/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
conv1d_1/Conv1D/ExpandDims
ExpandDimsinputs'conv1d_1/Conv1D/ExpandDims/dim:output:0*
T0*/
_output_shapes
:���������	�
+conv1d_1/Conv1D/ExpandDims_1/ReadVariableOpReadVariableOp4conv1d_1_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:	*
dtype0b
 conv1d_1/Conv1D/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : �
conv1d_1/Conv1D/ExpandDims_1
ExpandDims3conv1d_1/Conv1D/ExpandDims_1/ReadVariableOp:value:0)conv1d_1/Conv1D/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:	�
conv1d_1/Conv1DConv2D#conv1d_1/Conv1D/ExpandDims:output:0%conv1d_1/Conv1D/ExpandDims_1:output:0*
T0*/
_output_shapes
:���������*
paddingVALID*
strides
�
conv1d_1/Conv1D/SqueezeSqueezeconv1d_1/Conv1D:output:0*
T0*+
_output_shapes
:���������*
squeeze_dims

����������
conv1d_1/BiasAdd/ReadVariableOpReadVariableOp(conv1d_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
conv1d_1/BiasAddBiasAdd conv1d_1/Conv1D/Squeeze:output:0'conv1d_1/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������d
conv1d_1/EluEluconv1d_1/BiasAdd:output:0*
T0*+
_output_shapes
:���������
#conv1d_1/ActivityRegularizer/SquareSquareconv1d_1/Elu:activations:0*
T0*+
_output_shapes
:���������w
"conv1d_1/ActivityRegularizer/ConstConst*
_output_shapes
:*
dtype0*!
valueB"          �
 conv1d_1/ActivityRegularizer/SumSum'conv1d_1/ActivityRegularizer/Square:y:0+conv1d_1/ActivityRegularizer/Const:output:0*
T0*
_output_shapes
: g
"conv1d_1/ActivityRegularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
 conv1d_1/ActivityRegularizer/mulMul+conv1d_1/ActivityRegularizer/mul/x:output:0)conv1d_1/ActivityRegularizer/Sum:output:0*
T0*
_output_shapes
: l
"conv1d_1/ActivityRegularizer/ShapeShapeconv1d_1/Elu:activations:0*
T0*
_output_shapes
:z
0conv1d_1/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: |
2conv1d_1/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:|
2conv1d_1/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
*conv1d_1/ActivityRegularizer/strided_sliceStridedSlice+conv1d_1/ActivityRegularizer/Shape:output:09conv1d_1/ActivityRegularizer/strided_slice/stack:output:0;conv1d_1/ActivityRegularizer/strided_slice/stack_1:output:0;conv1d_1/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
!conv1d_1/ActivityRegularizer/CastCast3conv1d_1/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
$conv1d_1/ActivityRegularizer/truedivRealDiv$conv1d_1/ActivityRegularizer/mul:z:0%conv1d_1/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: `
flatten_1/ConstConst*
_output_shapes
:*
dtype0*
valueB"�����   �
flatten_1/ReshapeReshapeconv1d_1/Elu:activations:0flatten_1/Const:output:0*
T0*(
_output_shapes
:�����������
dense_3/MatMul/ReadVariableOpReadVariableOp&dense_3_matmul_readvariableop_resource* 
_output_shapes
:
��*
dtype0�
dense_3/MatMulMatMulflatten_1/Reshape:output:0%dense_3/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
dense_3/BiasAdd/ReadVariableOpReadVariableOp'dense_3_biasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0�
dense_3/BiasAddBiasAdddense_3/MatMul:product:0&dense_3/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������a
dense_3/ReluReludense_3/BiasAdd:output:0*
T0*(
_output_shapes
:����������{
"dense_3/ActivityRegularizer/SquareSquaredense_3/Relu:activations:0*
T0*(
_output_shapes
:����������r
!dense_3/ActivityRegularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
dense_3/ActivityRegularizer/SumSum&dense_3/ActivityRegularizer/Square:y:0*dense_3/ActivityRegularizer/Const:output:0*
T0*
_output_shapes
: f
!dense_3/ActivityRegularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_3/ActivityRegularizer/mulMul*dense_3/ActivityRegularizer/mul/x:output:0(dense_3/ActivityRegularizer/Sum:output:0*
T0*
_output_shapes
: k
!dense_3/ActivityRegularizer/ShapeShapedense_3/Relu:activations:0*
T0*
_output_shapes
:y
/dense_3/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: {
1dense_3/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1dense_3/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)dense_3/ActivityRegularizer/strided_sliceStridedSlice*dense_3/ActivityRegularizer/Shape:output:08dense_3/ActivityRegularizer/strided_slice/stack:output:0:dense_3/ActivityRegularizer/strided_slice/stack_1:output:0:dense_3/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
 dense_3/ActivityRegularizer/CastCast2dense_3/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
#dense_3/ActivityRegularizer/truedivRealDiv#dense_3/ActivityRegularizer/mul:z:0$dense_3/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: \
dropout_1/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *���?�
dropout_1/dropout/MulMuldense_3/Relu:activations:0 dropout_1/dropout/Const:output:0*
T0*(
_output_shapes
:����������a
dropout_1/dropout/ShapeShapedense_3/Relu:activations:0*
T0*
_output_shapes
:�
.dropout_1/dropout/random_uniform/RandomUniformRandomUniform dropout_1/dropout/Shape:output:0*
T0*(
_output_shapes
:����������*
dtype0e
 dropout_1/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *
ף<�
dropout_1/dropout/GreaterEqualGreaterEqual7dropout_1/dropout/random_uniform/RandomUniform:output:0)dropout_1/dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:�����������
dropout_1/dropout/CastCast"dropout_1/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:�����������
dropout_1/dropout/Mul_1Muldropout_1/dropout/Mul:z:0dropout_1/dropout/Cast:y:0*
T0*(
_output_shapes
:�����������
dense_4/MatMul/ReadVariableOpReadVariableOp&dense_4_matmul_readvariableop_resource*
_output_shapes
:	�2*
dtype0�
dense_4/MatMulMatMuldropout_1/dropout/Mul_1:z:0%dense_4/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2�
dense_4/BiasAdd/ReadVariableOpReadVariableOp'dense_4_biasadd_readvariableop_resource*
_output_shapes
:2*
dtype0�
dense_4/BiasAddBiasAdddense_4/MatMul:product:0&dense_4/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2`
dense_4/ReluReludense_4/BiasAdd:output:0*
T0*'
_output_shapes
:���������2z
"dense_4/ActivityRegularizer/SquareSquaredense_4/Relu:activations:0*
T0*'
_output_shapes
:���������2r
!dense_4/ActivityRegularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
dense_4/ActivityRegularizer/SumSum&dense_4/ActivityRegularizer/Square:y:0*dense_4/ActivityRegularizer/Const:output:0*
T0*
_output_shapes
: f
!dense_4/ActivityRegularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_4/ActivityRegularizer/mulMul*dense_4/ActivityRegularizer/mul/x:output:0(dense_4/ActivityRegularizer/Sum:output:0*
T0*
_output_shapes
: k
!dense_4/ActivityRegularizer/ShapeShapedense_4/Relu:activations:0*
T0*
_output_shapes
:y
/dense_4/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: {
1dense_4/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1dense_4/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)dense_4/ActivityRegularizer/strided_sliceStridedSlice*dense_4/ActivityRegularizer/Shape:output:08dense_4/ActivityRegularizer/strided_slice/stack:output:0:dense_4/ActivityRegularizer/strided_slice/stack_1:output:0:dense_4/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
 dense_4/ActivityRegularizer/CastCast2dense_4/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
#dense_4/ActivityRegularizer/truedivRealDiv#dense_4/ActivityRegularizer/mul:z:0$dense_4/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: �
dense_5/MatMul/ReadVariableOpReadVariableOp&dense_5_matmul_readvariableop_resource*
_output_shapes

:2	*
dtype0�
dense_5/MatMulMatMuldense_4/Relu:activations:0%dense_5/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������	�
dense_5/BiasAdd/ReadVariableOpReadVariableOp'dense_5_biasadd_readvariableop_resource*
_output_shapes
:	*
dtype0�
dense_5/BiasAddBiasAdddense_5/MatMul:product:0&dense_5/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������	x
"dense_5/ActivityRegularizer/SquareSquaredense_5/BiasAdd:output:0*
T0*'
_output_shapes
:���������	r
!dense_5/ActivityRegularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
dense_5/ActivityRegularizer/SumSum&dense_5/ActivityRegularizer/Square:y:0*dense_5/ActivityRegularizer/Const:output:0*
T0*
_output_shapes
: f
!dense_5/ActivityRegularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_5/ActivityRegularizer/mulMul*dense_5/ActivityRegularizer/mul/x:output:0(dense_5/ActivityRegularizer/Sum:output:0*
T0*
_output_shapes
: i
!dense_5/ActivityRegularizer/ShapeShapedense_5/BiasAdd:output:0*
T0*
_output_shapes
:y
/dense_5/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: {
1dense_5/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1dense_5/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)dense_5/ActivityRegularizer/strided_sliceStridedSlice*dense_5/ActivityRegularizer/Shape:output:08dense_5/ActivityRegularizer/strided_slice/stack:output:0:dense_5/ActivityRegularizer/strided_slice/stack_1:output:0:dense_5/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
 dense_5/ActivityRegularizer/CastCast2dense_5/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
#dense_5/ActivityRegularizer/truedivRealDiv#dense_5/ActivityRegularizer/mul:z:0$dense_5/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: h
softmax_1/SoftmaxSoftmaxdense_5/BiasAdd:output:0*
T0*'
_output_shapes
:���������	�
1conv1d_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp4conv1d_1_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:	*
dtype0�
"conv1d_1/kernel/Regularizer/SquareSquare9conv1d_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*"
_output_shapes
:	v
!conv1d_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*!
valueB"          �
conv1d_1/kernel/Regularizer/SumSum&conv1d_1/kernel/Regularizer/Square:y:0*conv1d_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: f
!conv1d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
conv1d_1/kernel/Regularizer/mulMul*conv1d_1/kernel/Regularizer/mul/x:output:0(conv1d_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
/conv1d_1/bias/Regularizer/Square/ReadVariableOpReadVariableOp(conv1d_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
 conv1d_1/bias/Regularizer/SquareSquare7conv1d_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:i
conv1d_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
conv1d_1/bias/Regularizer/SumSum$conv1d_1/bias/Regularizer/Square:y:0(conv1d_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: d
conv1d_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
conv1d_1/bias/Regularizer/mulMul(conv1d_1/bias/Regularizer/mul/x:output:0&conv1d_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
.dense_3/bias/Regularizer/Square/ReadVariableOpReadVariableOp'dense_3_biasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0�
dense_3/bias/Regularizer/SquareSquare6dense_3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes	
:�h
dense_3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_3/bias/Regularizer/SumSum#dense_3/bias/Regularizer/Square:y:0'dense_3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_3/bias/Regularizer/mulMul'dense_3/bias/Regularizer/mul/x:output:0%dense_3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
.dense_4/bias/Regularizer/Square/ReadVariableOpReadVariableOp'dense_4_biasadd_readvariableop_resource*
_output_shapes
:2*
dtype0�
dense_4/bias/Regularizer/SquareSquare6dense_4/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2h
dense_4/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_4/bias/Regularizer/SumSum#dense_4/bias/Regularizer/Square:y:0'dense_4/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_4/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_4/bias/Regularizer/mulMul'dense_4/bias/Regularizer/mul/x:output:0%dense_4/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
.dense_5/bias/Regularizer/Square/ReadVariableOpReadVariableOp'dense_5_biasadd_readvariableop_resource*
_output_shapes
:	*
dtype0�
dense_5/bias/Regularizer/SquareSquare6dense_5/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	h
dense_5/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_5/bias/Regularizer/SumSum#dense_5/bias/Regularizer/Square:y:0'dense_5/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_5/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_5/bias/Regularizer/mulMul'dense_5/bias/Regularizer/mul/x:output:0%dense_5/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: j
IdentityIdentitysoftmax_1/Softmax:softmax:0^NoOp*
T0*'
_output_shapes
:���������	h

Identity_1Identity(conv1d_1/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: g

Identity_2Identity'dense_3/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: g

Identity_3Identity'dense_4/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: g

Identity_4Identity'dense_5/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp ^conv1d_1/BiasAdd/ReadVariableOp,^conv1d_1/Conv1D/ExpandDims_1/ReadVariableOp0^conv1d_1/bias/Regularizer/Square/ReadVariableOp2^conv1d_1/kernel/Regularizer/Square/ReadVariableOp^dense_3/BiasAdd/ReadVariableOp^dense_3/MatMul/ReadVariableOp/^dense_3/bias/Regularizer/Square/ReadVariableOp^dense_4/BiasAdd/ReadVariableOp^dense_4/MatMul/ReadVariableOp/^dense_4/bias/Regularizer/Square/ReadVariableOp^dense_5/BiasAdd/ReadVariableOp^dense_5/MatMul/ReadVariableOp/^dense_5/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0"!

identity_3Identity_3:output:0"!

identity_4Identity_4:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������	: : : : : : : : 2B
conv1d_1/BiasAdd/ReadVariableOpconv1d_1/BiasAdd/ReadVariableOp2Z
+conv1d_1/Conv1D/ExpandDims_1/ReadVariableOp+conv1d_1/Conv1D/ExpandDims_1/ReadVariableOp2b
/conv1d_1/bias/Regularizer/Square/ReadVariableOp/conv1d_1/bias/Regularizer/Square/ReadVariableOp2f
1conv1d_1/kernel/Regularizer/Square/ReadVariableOp1conv1d_1/kernel/Regularizer/Square/ReadVariableOp2@
dense_3/BiasAdd/ReadVariableOpdense_3/BiasAdd/ReadVariableOp2>
dense_3/MatMul/ReadVariableOpdense_3/MatMul/ReadVariableOp2`
.dense_3/bias/Regularizer/Square/ReadVariableOp.dense_3/bias/Regularizer/Square/ReadVariableOp2@
dense_4/BiasAdd/ReadVariableOpdense_4/BiasAdd/ReadVariableOp2>
dense_4/MatMul/ReadVariableOpdense_4/MatMul/ReadVariableOp2`
.dense_4/bias/Regularizer/Square/ReadVariableOp.dense_4/bias/Regularizer/Square/ReadVariableOp2@
dense_5/BiasAdd/ReadVariableOpdense_5/BiasAdd/ReadVariableOp2>
dense_5/MatMul/ReadVariableOpdense_5/MatMul/ReadVariableOp2`
.dense_5/bias/Regularizer/Square/ReadVariableOp.dense_5/bias/Regularizer/Square/ReadVariableOp:S O
+
_output_shapes
:���������	
 
_user_specified_nameinputs
�{
�
J__inference_sequential_1_layer_call_and_return_conditional_losses_17903030
conv1d_1_input'
conv1d_1_17902940:	
conv1d_1_17902942:$
dense_3_17902954:
��
dense_3_17902956:	�#
dense_4_17902968:	�2
dense_4_17902970:2"
dense_5_17902981:2	
dense_5_17902983:	
identity

identity_1

identity_2

identity_3

identity_4�� conv1d_1/StatefulPartitionedCall�/conv1d_1/bias/Regularizer/Square/ReadVariableOp�1conv1d_1/kernel/Regularizer/Square/ReadVariableOp�dense_3/StatefulPartitionedCall�.dense_3/bias/Regularizer/Square/ReadVariableOp�dense_4/StatefulPartitionedCall�.dense_4/bias/Regularizer/Square/ReadVariableOp�dense_5/StatefulPartitionedCall�.dense_5/bias/Regularizer/Square/ReadVariableOp�!dropout_1/StatefulPartitionedCall�
 conv1d_1/StatefulPartitionedCallStatefulPartitionedCallconv1d_1_inputconv1d_1_17902940conv1d_1_17902942*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *O
fJRH
F__inference_conv1d_1_layer_call_and_return_conditional_losses_17902367�
,conv1d_1/ActivityRegularizer/PartitionedCallPartitionedCall)conv1d_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *;
f6R4
2__inference_conv1d_1_activity_regularizer_17902293{
"conv1d_1/ActivityRegularizer/ShapeShape)conv1d_1/StatefulPartitionedCall:output:0*
T0*
_output_shapes
:z
0conv1d_1/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: |
2conv1d_1/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:|
2conv1d_1/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
*conv1d_1/ActivityRegularizer/strided_sliceStridedSlice+conv1d_1/ActivityRegularizer/Shape:output:09conv1d_1/ActivityRegularizer/strided_slice/stack:output:0;conv1d_1/ActivityRegularizer/strided_slice/stack_1:output:0;conv1d_1/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
!conv1d_1/ActivityRegularizer/CastCast3conv1d_1/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
$conv1d_1/ActivityRegularizer/truedivRealDiv5conv1d_1/ActivityRegularizer/PartitionedCall:output:0%conv1d_1/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: �
flatten_1/PartitionedCallPartitionedCall)conv1d_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *P
fKRI
G__inference_flatten_1_layer_call_and_return_conditional_losses_17902387�
dense_3/StatefulPartitionedCallStatefulPartitionedCall"flatten_1/PartitionedCall:output:0dense_3_17902954dense_3_17902956*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *N
fIRG
E__inference_dense_3_layer_call_and_return_conditional_losses_17902406�
+dense_3/ActivityRegularizer/PartitionedCallPartitionedCall(dense_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *:
f5R3
1__inference_dense_3_activity_regularizer_17902306y
!dense_3/ActivityRegularizer/ShapeShape(dense_3/StatefulPartitionedCall:output:0*
T0*
_output_shapes
:y
/dense_3/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: {
1dense_3/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1dense_3/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)dense_3/ActivityRegularizer/strided_sliceStridedSlice*dense_3/ActivityRegularizer/Shape:output:08dense_3/ActivityRegularizer/strided_slice/stack:output:0:dense_3/ActivityRegularizer/strided_slice/stack_1:output:0:dense_3/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
 dense_3/ActivityRegularizer/CastCast2dense_3/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
#dense_3/ActivityRegularizer/truedivRealDiv4dense_3/ActivityRegularizer/PartitionedCall:output:0$dense_3/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: �
!dropout_1/StatefulPartitionedCallStatefulPartitionedCall(dense_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *P
fKRI
G__inference_dropout_1_layer_call_and_return_conditional_losses_17902623�
dense_4/StatefulPartitionedCallStatefulPartitionedCall*dropout_1/StatefulPartitionedCall:output:0dense_4_17902968dense_4_17902970*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *N
fIRG
E__inference_dense_4_layer_call_and_return_conditional_losses_17902444�
+dense_4/ActivityRegularizer/PartitionedCallPartitionedCall(dense_4/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *:
f5R3
1__inference_dense_4_activity_regularizer_17902319y
!dense_4/ActivityRegularizer/ShapeShape(dense_4/StatefulPartitionedCall:output:0*
T0*
_output_shapes
:y
/dense_4/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: {
1dense_4/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1dense_4/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)dense_4/ActivityRegularizer/strided_sliceStridedSlice*dense_4/ActivityRegularizer/Shape:output:08dense_4/ActivityRegularizer/strided_slice/stack:output:0:dense_4/ActivityRegularizer/strided_slice/stack_1:output:0:dense_4/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
 dense_4/ActivityRegularizer/CastCast2dense_4/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
#dense_4/ActivityRegularizer/truedivRealDiv4dense_4/ActivityRegularizer/PartitionedCall:output:0$dense_4/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: �
dense_5/StatefulPartitionedCallStatefulPartitionedCall(dense_4/StatefulPartitionedCall:output:0dense_5_17902981dense_5_17902983*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������	*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *N
fIRG
E__inference_dense_5_layer_call_and_return_conditional_losses_17902474�
+dense_5/ActivityRegularizer/PartitionedCallPartitionedCall(dense_5/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *:
f5R3
1__inference_dense_5_activity_regularizer_17902332y
!dense_5/ActivityRegularizer/ShapeShape(dense_5/StatefulPartitionedCall:output:0*
T0*
_output_shapes
:y
/dense_5/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: {
1dense_5/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1dense_5/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)dense_5/ActivityRegularizer/strided_sliceStridedSlice*dense_5/ActivityRegularizer/Shape:output:08dense_5/ActivityRegularizer/strided_slice/stack:output:0:dense_5/ActivityRegularizer/strided_slice/stack_1:output:0:dense_5/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
 dense_5/ActivityRegularizer/CastCast2dense_5/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
#dense_5/ActivityRegularizer/truedivRealDiv4dense_5/ActivityRegularizer/PartitionedCall:output:0$dense_5/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: �
softmax_1/PartitionedCallPartitionedCall(dense_5/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������	* 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *P
fKRI
G__inference_softmax_1_layer_call_and_return_conditional_losses_17902493�
1conv1d_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv1d_1_17902940*"
_output_shapes
:	*
dtype0�
"conv1d_1/kernel/Regularizer/SquareSquare9conv1d_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*"
_output_shapes
:	v
!conv1d_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*!
valueB"          �
conv1d_1/kernel/Regularizer/SumSum&conv1d_1/kernel/Regularizer/Square:y:0*conv1d_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: f
!conv1d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
conv1d_1/kernel/Regularizer/mulMul*conv1d_1/kernel/Regularizer/mul/x:output:0(conv1d_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: }
/conv1d_1/bias/Regularizer/Square/ReadVariableOpReadVariableOpconv1d_1_17902942*
_output_shapes
:*
dtype0�
 conv1d_1/bias/Regularizer/SquareSquare7conv1d_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:i
conv1d_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
conv1d_1/bias/Regularizer/SumSum$conv1d_1/bias/Regularizer/Square:y:0(conv1d_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: d
conv1d_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
conv1d_1/bias/Regularizer/mulMul(conv1d_1/bias/Regularizer/mul/x:output:0&conv1d_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: |
.dense_3/bias/Regularizer/Square/ReadVariableOpReadVariableOpdense_3_17902956*
_output_shapes	
:�*
dtype0�
dense_3/bias/Regularizer/SquareSquare6dense_3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes	
:�h
dense_3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_3/bias/Regularizer/SumSum#dense_3/bias/Regularizer/Square:y:0'dense_3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_3/bias/Regularizer/mulMul'dense_3/bias/Regularizer/mul/x:output:0%dense_3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: {
.dense_4/bias/Regularizer/Square/ReadVariableOpReadVariableOpdense_4_17902970*
_output_shapes
:2*
dtype0�
dense_4/bias/Regularizer/SquareSquare6dense_4/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2h
dense_4/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_4/bias/Regularizer/SumSum#dense_4/bias/Regularizer/Square:y:0'dense_4/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_4/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_4/bias/Regularizer/mulMul'dense_4/bias/Regularizer/mul/x:output:0%dense_4/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: {
.dense_5/bias/Regularizer/Square/ReadVariableOpReadVariableOpdense_5_17902983*
_output_shapes
:	*
dtype0�
dense_5/bias/Regularizer/SquareSquare6dense_5/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	h
dense_5/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_5/bias/Regularizer/SumSum#dense_5/bias/Regularizer/Square:y:0'dense_5/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_5/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_5/bias/Regularizer/mulMul'dense_5/bias/Regularizer/mul/x:output:0%dense_5/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: q
IdentityIdentity"softmax_1/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������	h

Identity_1Identity(conv1d_1/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: g

Identity_2Identity'dense_3/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: g

Identity_3Identity'dense_4/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: g

Identity_4Identity'dense_5/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp!^conv1d_1/StatefulPartitionedCall0^conv1d_1/bias/Regularizer/Square/ReadVariableOp2^conv1d_1/kernel/Regularizer/Square/ReadVariableOp ^dense_3/StatefulPartitionedCall/^dense_3/bias/Regularizer/Square/ReadVariableOp ^dense_4/StatefulPartitionedCall/^dense_4/bias/Regularizer/Square/ReadVariableOp ^dense_5/StatefulPartitionedCall/^dense_5/bias/Regularizer/Square/ReadVariableOp"^dropout_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0"!

identity_3Identity_3:output:0"!

identity_4Identity_4:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������	: : : : : : : : 2D
 conv1d_1/StatefulPartitionedCall conv1d_1/StatefulPartitionedCall2b
/conv1d_1/bias/Regularizer/Square/ReadVariableOp/conv1d_1/bias/Regularizer/Square/ReadVariableOp2f
1conv1d_1/kernel/Regularizer/Square/ReadVariableOp1conv1d_1/kernel/Regularizer/Square/ReadVariableOp2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2`
.dense_3/bias/Regularizer/Square/ReadVariableOp.dense_3/bias/Regularizer/Square/ReadVariableOp2B
dense_4/StatefulPartitionedCalldense_4/StatefulPartitionedCall2`
.dense_4/bias/Regularizer/Square/ReadVariableOp.dense_4/bias/Regularizer/Square/ReadVariableOp2B
dense_5/StatefulPartitionedCalldense_5/StatefulPartitionedCall2`
.dense_5/bias/Regularizer/Square/ReadVariableOp.dense_5/bias/Regularizer/Square/ReadVariableOp2F
!dropout_1/StatefulPartitionedCall!dropout_1/StatefulPartitionedCall:[ W
+
_output_shapes
:���������	
(
_user_specified_nameconv1d_1_input
�
�
I__inference_dense_4_layer_call_and_return_all_conditional_losses_17903563

inputs
unknown:	�2
	unknown_0:2
identity

identity_1��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *N
fIRG
E__inference_dense_4_layer_call_and_return_conditional_losses_17902444�
PartitionedCallPartitionedCall StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *:
f5R3
1__inference_dense_4_activity_regularizer_17902319o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2X

Identity_1IdentityPartitionedCall:output:0^NoOp*
T0*
_output_shapes
: `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
E__inference_dense_5_layer_call_and_return_conditional_losses_17903616

inputs0
matmul_readvariableop_resource:2	-
biasadd_readvariableop_resource:	
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�.dense_5/bias/Regularizer/Square/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:2	*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������	r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:	*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������	�
.dense_5/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:	*
dtype0�
dense_5/bias/Regularizer/SquareSquare6dense_5/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	h
dense_5/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_5/bias/Regularizer/SumSum#dense_5/bias/Regularizer/Square:y:0'dense_5/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_5/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_5/bias/Regularizer/mulMul'dense_5/bias/Regularizer/mul/x:output:0%dense_5/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: _
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:���������	�
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp/^dense_5/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������2: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2`
.dense_5/bias/Regularizer/Square/ReadVariableOp.dense_5/bias/Regularizer/Square/ReadVariableOp:O K
'
_output_shapes
:���������2
 
_user_specified_nameinputs
��
�
$__inference__traced_restore_17903912
file_prefix6
 assignvariableop_conv1d_1_kernel:	.
 assignvariableop_1_conv1d_1_bias:5
!assignvariableop_2_dense_3_kernel:
��.
assignvariableop_3_dense_3_bias:	�4
!assignvariableop_4_dense_4_kernel:	�2-
assignvariableop_5_dense_4_bias:23
!assignvariableop_6_dense_5_kernel:2	-
assignvariableop_7_dense_5_bias:	&
assignvariableop_8_adam_iter:	 (
assignvariableop_9_adam_beta_1: )
assignvariableop_10_adam_beta_2: (
assignvariableop_11_adam_decay: 0
&assignvariableop_12_adam_learning_rate: %
assignvariableop_13_total_1: %
assignvariableop_14_count_1: #
assignvariableop_15_total: #
assignvariableop_16_count: @
*assignvariableop_17_adam_conv1d_1_kernel_m:	6
(assignvariableop_18_adam_conv1d_1_bias_m:=
)assignvariableop_19_adam_dense_3_kernel_m:
��6
'assignvariableop_20_adam_dense_3_bias_m:	�<
)assignvariableop_21_adam_dense_4_kernel_m:	�25
'assignvariableop_22_adam_dense_4_bias_m:2;
)assignvariableop_23_adam_dense_5_kernel_m:2	5
'assignvariableop_24_adam_dense_5_bias_m:	@
*assignvariableop_25_adam_conv1d_1_kernel_v:	6
(assignvariableop_26_adam_conv1d_1_bias_v:=
)assignvariableop_27_adam_dense_3_kernel_v:
��6
'assignvariableop_28_adam_dense_3_bias_v:	�<
)assignvariableop_29_adam_dense_4_kernel_v:	�25
'assignvariableop_30_adam_dense_4_bias_v:2;
)assignvariableop_31_adam_dense_5_kernel_v:2	5
'assignvariableop_32_adam_dense_5_bias_v:	
identity_34��AssignVariableOp�AssignVariableOp_1�AssignVariableOp_10�AssignVariableOp_11�AssignVariableOp_12�AssignVariableOp_13�AssignVariableOp_14�AssignVariableOp_15�AssignVariableOp_16�AssignVariableOp_17�AssignVariableOp_18�AssignVariableOp_19�AssignVariableOp_2�AssignVariableOp_20�AssignVariableOp_21�AssignVariableOp_22�AssignVariableOp_23�AssignVariableOp_24�AssignVariableOp_25�AssignVariableOp_26�AssignVariableOp_27�AssignVariableOp_28�AssignVariableOp_29�AssignVariableOp_3�AssignVariableOp_30�AssignVariableOp_31�AssignVariableOp_32�AssignVariableOp_4�AssignVariableOp_5�AssignVariableOp_6�AssignVariableOp_7�AssignVariableOp_8�AssignVariableOp_9�
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:"*
dtype0*�
value�B�"B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:"*
dtype0*W
valueNBL"B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B �
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*�
_output_shapes�
�::::::::::::::::::::::::::::::::::*0
dtypes&
$2"	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOpAssignVariableOp assignvariableop_conv1d_1_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_1AssignVariableOp assignvariableop_1_conv1d_1_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_2AssignVariableOp!assignvariableop_2_dense_3_kernelIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_3AssignVariableOpassignvariableop_3_dense_3_biasIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_4AssignVariableOp!assignvariableop_4_dense_4_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_5AssignVariableOpassignvariableop_5_dense_4_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_6AssignVariableOp!assignvariableop_6_dense_5_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_7AssignVariableOpassignvariableop_7_dense_5_biasIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_8AssignVariableOpassignvariableop_8_adam_iterIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_9AssignVariableOpassignvariableop_9_adam_beta_1Identity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_10AssignVariableOpassignvariableop_10_adam_beta_2Identity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_11AssignVariableOpassignvariableop_11_adam_decayIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_12AssignVariableOp&assignvariableop_12_adam_learning_rateIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_13AssignVariableOpassignvariableop_13_total_1Identity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_14AssignVariableOpassignvariableop_14_count_1Identity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_15AssignVariableOpassignvariableop_15_totalIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_16AssignVariableOpassignvariableop_16_countIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_17AssignVariableOp*assignvariableop_17_adam_conv1d_1_kernel_mIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_18AssignVariableOp(assignvariableop_18_adam_conv1d_1_bias_mIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_19AssignVariableOp)assignvariableop_19_adam_dense_3_kernel_mIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_20AssignVariableOp'assignvariableop_20_adam_dense_3_bias_mIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_21AssignVariableOp)assignvariableop_21_adam_dense_4_kernel_mIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_22AssignVariableOp'assignvariableop_22_adam_dense_4_bias_mIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_23AssignVariableOp)assignvariableop_23_adam_dense_5_kernel_mIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_24AssignVariableOp'assignvariableop_24_adam_dense_5_bias_mIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_25AssignVariableOp*assignvariableop_25_adam_conv1d_1_kernel_vIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_26AssignVariableOp(assignvariableop_26_adam_conv1d_1_bias_vIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_27AssignVariableOp)assignvariableop_27_adam_dense_3_kernel_vIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_28AssignVariableOp'assignvariableop_28_adam_dense_3_bias_vIdentity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_29AssignVariableOp)assignvariableop_29_adam_dense_4_kernel_vIdentity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_30AssignVariableOp'assignvariableop_30_adam_dense_4_bias_vIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_31AssignVariableOp)assignvariableop_31_adam_dense_5_kernel_vIdentity_31:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_32AssignVariableOp'assignvariableop_32_adam_dense_5_bias_vIdentity_32:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 �
Identity_33Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_34IdentityIdentity_33:output:0^NoOp_1*
T0*
_output_shapes
: �
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_34Identity_34:output:0*W
_input_shapesF
D: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
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
AssignVariableOp_32AssignVariableOp_322(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
�F
�
!__inference__traced_save_17903803
file_prefix.
*savev2_conv1d_1_kernel_read_readvariableop,
(savev2_conv1d_1_bias_read_readvariableop-
)savev2_dense_3_kernel_read_readvariableop+
'savev2_dense_3_bias_read_readvariableop-
)savev2_dense_4_kernel_read_readvariableop+
'savev2_dense_4_bias_read_readvariableop-
)savev2_dense_5_kernel_read_readvariableop+
'savev2_dense_5_bias_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop&
"savev2_total_1_read_readvariableop&
"savev2_count_1_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop5
1savev2_adam_conv1d_1_kernel_m_read_readvariableop3
/savev2_adam_conv1d_1_bias_m_read_readvariableop4
0savev2_adam_dense_3_kernel_m_read_readvariableop2
.savev2_adam_dense_3_bias_m_read_readvariableop4
0savev2_adam_dense_4_kernel_m_read_readvariableop2
.savev2_adam_dense_4_bias_m_read_readvariableop4
0savev2_adam_dense_5_kernel_m_read_readvariableop2
.savev2_adam_dense_5_bias_m_read_readvariableop5
1savev2_adam_conv1d_1_kernel_v_read_readvariableop3
/savev2_adam_conv1d_1_bias_v_read_readvariableop4
0savev2_adam_dense_3_kernel_v_read_readvariableop2
.savev2_adam_dense_3_bias_v_read_readvariableop4
0savev2_adam_dense_4_kernel_v_read_readvariableop2
.savev2_adam_dense_4_bias_v_read_readvariableop4
0savev2_adam_dense_5_kernel_v_read_readvariableop2
.savev2_adam_dense_5_bias_v_read_readvariableop
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
: �
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:"*
dtype0*�
value�B�"B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:"*
dtype0*W
valueNBL"B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B �
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0*savev2_conv1d_1_kernel_read_readvariableop(savev2_conv1d_1_bias_read_readvariableop)savev2_dense_3_kernel_read_readvariableop'savev2_dense_3_bias_read_readvariableop)savev2_dense_4_kernel_read_readvariableop'savev2_dense_4_bias_read_readvariableop)savev2_dense_5_kernel_read_readvariableop'savev2_dense_5_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop1savev2_adam_conv1d_1_kernel_m_read_readvariableop/savev2_adam_conv1d_1_bias_m_read_readvariableop0savev2_adam_dense_3_kernel_m_read_readvariableop.savev2_adam_dense_3_bias_m_read_readvariableop0savev2_adam_dense_4_kernel_m_read_readvariableop.savev2_adam_dense_4_bias_m_read_readvariableop0savev2_adam_dense_5_kernel_m_read_readvariableop.savev2_adam_dense_5_bias_m_read_readvariableop1savev2_adam_conv1d_1_kernel_v_read_readvariableop/savev2_adam_conv1d_1_bias_v_read_readvariableop0savev2_adam_dense_3_kernel_v_read_readvariableop.savev2_adam_dense_3_bias_v_read_readvariableop0savev2_adam_dense_4_kernel_v_read_readvariableop.savev2_adam_dense_4_bias_v_read_readvariableop0savev2_adam_dense_5_kernel_v_read_readvariableop.savev2_adam_dense_5_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *0
dtypes&
$2"	�
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

identity_1Identity_1:output:0*�
_input_shapes�
�: :	::
��:�:	�2:2:2	:	: : : : : : : : : :	::
��:�:	�2:2:2	:	:	::
��:�:	�2:2:2	:	: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:($
"
_output_shapes
:	: 

_output_shapes
::&"
 
_output_shapes
:
��:!

_output_shapes	
:�:%!

_output_shapes
:	�2: 

_output_shapes
:2:$ 

_output_shapes

:2	: 

_output_shapes
:	:	

_output_shapes
: :


_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :($
"
_output_shapes
:	: 

_output_shapes
::&"
 
_output_shapes
:
��:!

_output_shapes	
:�:%!

_output_shapes
:	�2: 

_output_shapes
:2:$ 

_output_shapes

:2	: 

_output_shapes
:	:($
"
_output_shapes
:	: 

_output_shapes
::&"
 
_output_shapes
:
��:!

_output_shapes	
:�:%!

_output_shapes
:	�2: 

_output_shapes
:2:$  

_output_shapes

:2	: !

_output_shapes
:	:"

_output_shapes
: 
�
H
,__inference_softmax_1_layer_call_fn_17903621

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
:���������	* 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *P
fKRI
G__inference_softmax_1_layer_call_and_return_conditional_losses_17902493`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������	:O K
'
_output_shapes
:���������	
 
_user_specified_nameinputs
�{
�
J__inference_sequential_1_layer_call_and_return_conditional_losses_17902796

inputs'
conv1d_1_17902706:	
conv1d_1_17902708:$
dense_3_17902720:
��
dense_3_17902722:	�#
dense_4_17902734:	�2
dense_4_17902736:2"
dense_5_17902747:2	
dense_5_17902749:	
identity

identity_1

identity_2

identity_3

identity_4�� conv1d_1/StatefulPartitionedCall�/conv1d_1/bias/Regularizer/Square/ReadVariableOp�1conv1d_1/kernel/Regularizer/Square/ReadVariableOp�dense_3/StatefulPartitionedCall�.dense_3/bias/Regularizer/Square/ReadVariableOp�dense_4/StatefulPartitionedCall�.dense_4/bias/Regularizer/Square/ReadVariableOp�dense_5/StatefulPartitionedCall�.dense_5/bias/Regularizer/Square/ReadVariableOp�!dropout_1/StatefulPartitionedCall�
 conv1d_1/StatefulPartitionedCallStatefulPartitionedCallinputsconv1d_1_17902706conv1d_1_17902708*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *O
fJRH
F__inference_conv1d_1_layer_call_and_return_conditional_losses_17902367�
,conv1d_1/ActivityRegularizer/PartitionedCallPartitionedCall)conv1d_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *;
f6R4
2__inference_conv1d_1_activity_regularizer_17902293{
"conv1d_1/ActivityRegularizer/ShapeShape)conv1d_1/StatefulPartitionedCall:output:0*
T0*
_output_shapes
:z
0conv1d_1/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: |
2conv1d_1/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:|
2conv1d_1/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
*conv1d_1/ActivityRegularizer/strided_sliceStridedSlice+conv1d_1/ActivityRegularizer/Shape:output:09conv1d_1/ActivityRegularizer/strided_slice/stack:output:0;conv1d_1/ActivityRegularizer/strided_slice/stack_1:output:0;conv1d_1/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
!conv1d_1/ActivityRegularizer/CastCast3conv1d_1/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
$conv1d_1/ActivityRegularizer/truedivRealDiv5conv1d_1/ActivityRegularizer/PartitionedCall:output:0%conv1d_1/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: �
flatten_1/PartitionedCallPartitionedCall)conv1d_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *P
fKRI
G__inference_flatten_1_layer_call_and_return_conditional_losses_17902387�
dense_3/StatefulPartitionedCallStatefulPartitionedCall"flatten_1/PartitionedCall:output:0dense_3_17902720dense_3_17902722*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *N
fIRG
E__inference_dense_3_layer_call_and_return_conditional_losses_17902406�
+dense_3/ActivityRegularizer/PartitionedCallPartitionedCall(dense_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *:
f5R3
1__inference_dense_3_activity_regularizer_17902306y
!dense_3/ActivityRegularizer/ShapeShape(dense_3/StatefulPartitionedCall:output:0*
T0*
_output_shapes
:y
/dense_3/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: {
1dense_3/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1dense_3/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)dense_3/ActivityRegularizer/strided_sliceStridedSlice*dense_3/ActivityRegularizer/Shape:output:08dense_3/ActivityRegularizer/strided_slice/stack:output:0:dense_3/ActivityRegularizer/strided_slice/stack_1:output:0:dense_3/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
 dense_3/ActivityRegularizer/CastCast2dense_3/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
#dense_3/ActivityRegularizer/truedivRealDiv4dense_3/ActivityRegularizer/PartitionedCall:output:0$dense_3/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: �
!dropout_1/StatefulPartitionedCallStatefulPartitionedCall(dense_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *P
fKRI
G__inference_dropout_1_layer_call_and_return_conditional_losses_17902623�
dense_4/StatefulPartitionedCallStatefulPartitionedCall*dropout_1/StatefulPartitionedCall:output:0dense_4_17902734dense_4_17902736*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *N
fIRG
E__inference_dense_4_layer_call_and_return_conditional_losses_17902444�
+dense_4/ActivityRegularizer/PartitionedCallPartitionedCall(dense_4/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *:
f5R3
1__inference_dense_4_activity_regularizer_17902319y
!dense_4/ActivityRegularizer/ShapeShape(dense_4/StatefulPartitionedCall:output:0*
T0*
_output_shapes
:y
/dense_4/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: {
1dense_4/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1dense_4/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)dense_4/ActivityRegularizer/strided_sliceStridedSlice*dense_4/ActivityRegularizer/Shape:output:08dense_4/ActivityRegularizer/strided_slice/stack:output:0:dense_4/ActivityRegularizer/strided_slice/stack_1:output:0:dense_4/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
 dense_4/ActivityRegularizer/CastCast2dense_4/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
#dense_4/ActivityRegularizer/truedivRealDiv4dense_4/ActivityRegularizer/PartitionedCall:output:0$dense_4/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: �
dense_5/StatefulPartitionedCallStatefulPartitionedCall(dense_4/StatefulPartitionedCall:output:0dense_5_17902747dense_5_17902749*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������	*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *N
fIRG
E__inference_dense_5_layer_call_and_return_conditional_losses_17902474�
+dense_5/ActivityRegularizer/PartitionedCallPartitionedCall(dense_5/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *:
f5R3
1__inference_dense_5_activity_regularizer_17902332y
!dense_5/ActivityRegularizer/ShapeShape(dense_5/StatefulPartitionedCall:output:0*
T0*
_output_shapes
:y
/dense_5/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: {
1dense_5/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1dense_5/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)dense_5/ActivityRegularizer/strided_sliceStridedSlice*dense_5/ActivityRegularizer/Shape:output:08dense_5/ActivityRegularizer/strided_slice/stack:output:0:dense_5/ActivityRegularizer/strided_slice/stack_1:output:0:dense_5/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
 dense_5/ActivityRegularizer/CastCast2dense_5/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
#dense_5/ActivityRegularizer/truedivRealDiv4dense_5/ActivityRegularizer/PartitionedCall:output:0$dense_5/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: �
softmax_1/PartitionedCallPartitionedCall(dense_5/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������	* 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *P
fKRI
G__inference_softmax_1_layer_call_and_return_conditional_losses_17902493�
1conv1d_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv1d_1_17902706*"
_output_shapes
:	*
dtype0�
"conv1d_1/kernel/Regularizer/SquareSquare9conv1d_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*"
_output_shapes
:	v
!conv1d_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*!
valueB"          �
conv1d_1/kernel/Regularizer/SumSum&conv1d_1/kernel/Regularizer/Square:y:0*conv1d_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: f
!conv1d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
conv1d_1/kernel/Regularizer/mulMul*conv1d_1/kernel/Regularizer/mul/x:output:0(conv1d_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: }
/conv1d_1/bias/Regularizer/Square/ReadVariableOpReadVariableOpconv1d_1_17902708*
_output_shapes
:*
dtype0�
 conv1d_1/bias/Regularizer/SquareSquare7conv1d_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:i
conv1d_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
conv1d_1/bias/Regularizer/SumSum$conv1d_1/bias/Regularizer/Square:y:0(conv1d_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: d
conv1d_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
conv1d_1/bias/Regularizer/mulMul(conv1d_1/bias/Regularizer/mul/x:output:0&conv1d_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: |
.dense_3/bias/Regularizer/Square/ReadVariableOpReadVariableOpdense_3_17902722*
_output_shapes	
:�*
dtype0�
dense_3/bias/Regularizer/SquareSquare6dense_3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes	
:�h
dense_3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_3/bias/Regularizer/SumSum#dense_3/bias/Regularizer/Square:y:0'dense_3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_3/bias/Regularizer/mulMul'dense_3/bias/Regularizer/mul/x:output:0%dense_3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: {
.dense_4/bias/Regularizer/Square/ReadVariableOpReadVariableOpdense_4_17902736*
_output_shapes
:2*
dtype0�
dense_4/bias/Regularizer/SquareSquare6dense_4/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2h
dense_4/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_4/bias/Regularizer/SumSum#dense_4/bias/Regularizer/Square:y:0'dense_4/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_4/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_4/bias/Regularizer/mulMul'dense_4/bias/Regularizer/mul/x:output:0%dense_4/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: {
.dense_5/bias/Regularizer/Square/ReadVariableOpReadVariableOpdense_5_17902749*
_output_shapes
:	*
dtype0�
dense_5/bias/Regularizer/SquareSquare6dense_5/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	h
dense_5/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_5/bias/Regularizer/SumSum#dense_5/bias/Regularizer/Square:y:0'dense_5/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_5/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_5/bias/Regularizer/mulMul'dense_5/bias/Regularizer/mul/x:output:0%dense_5/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: q
IdentityIdentity"softmax_1/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������	h

Identity_1Identity(conv1d_1/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: g

Identity_2Identity'dense_3/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: g

Identity_3Identity'dense_4/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: g

Identity_4Identity'dense_5/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp!^conv1d_1/StatefulPartitionedCall0^conv1d_1/bias/Regularizer/Square/ReadVariableOp2^conv1d_1/kernel/Regularizer/Square/ReadVariableOp ^dense_3/StatefulPartitionedCall/^dense_3/bias/Regularizer/Square/ReadVariableOp ^dense_4/StatefulPartitionedCall/^dense_4/bias/Regularizer/Square/ReadVariableOp ^dense_5/StatefulPartitionedCall/^dense_5/bias/Regularizer/Square/ReadVariableOp"^dropout_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0"!

identity_3Identity_3:output:0"!

identity_4Identity_4:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������	: : : : : : : : 2D
 conv1d_1/StatefulPartitionedCall conv1d_1/StatefulPartitionedCall2b
/conv1d_1/bias/Regularizer/Square/ReadVariableOp/conv1d_1/bias/Regularizer/Square/ReadVariableOp2f
1conv1d_1/kernel/Regularizer/Square/ReadVariableOp1conv1d_1/kernel/Regularizer/Square/ReadVariableOp2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2`
.dense_3/bias/Regularizer/Square/ReadVariableOp.dense_3/bias/Regularizer/Square/ReadVariableOp2B
dense_4/StatefulPartitionedCalldense_4/StatefulPartitionedCall2`
.dense_4/bias/Regularizer/Square/ReadVariableOp.dense_4/bias/Regularizer/Square/ReadVariableOp2B
dense_5/StatefulPartitionedCalldense_5/StatefulPartitionedCall2`
.dense_5/bias/Regularizer/Square/ReadVariableOp.dense_5/bias/Regularizer/Square/ReadVariableOp2F
!dropout_1/StatefulPartitionedCall!dropout_1/StatefulPartitionedCall:S O
+
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
E__inference_dense_5_layer_call_and_return_conditional_losses_17902474

inputs0
matmul_readvariableop_resource:2	-
biasadd_readvariableop_resource:	
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�.dense_5/bias/Regularizer/Square/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:2	*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������	r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:	*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������	�
.dense_5/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:	*
dtype0�
dense_5/bias/Regularizer/SquareSquare6dense_5/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	h
dense_5/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_5/bias/Regularizer/SumSum#dense_5/bias/Regularizer/Square:y:0'dense_5/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_5/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_5/bias/Regularizer/mulMul'dense_5/bias/Regularizer/mul/x:output:0%dense_5/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: _
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:���������	�
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp/^dense_5/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������2: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2`
.dense_5/bias/Regularizer/Square/ReadVariableOp.dense_5/bias/Regularizer/Square/ReadVariableOp:O K
'
_output_shapes
:���������2
 
_user_specified_nameinputs
�
H
,__inference_flatten_1_layer_call_fn_17903473

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *P
fKRI
G__inference_flatten_1_layer_call_and_return_conditional_losses_17902387a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�z
�
#__inference__wrapped_model_17902280
conv1d_1_inputW
Asequential_1_conv1d_1_conv1d_expanddims_1_readvariableop_resource:	C
5sequential_1_conv1d_1_biasadd_readvariableop_resource:G
3sequential_1_dense_3_matmul_readvariableop_resource:
��C
4sequential_1_dense_3_biasadd_readvariableop_resource:	�F
3sequential_1_dense_4_matmul_readvariableop_resource:	�2B
4sequential_1_dense_4_biasadd_readvariableop_resource:2E
3sequential_1_dense_5_matmul_readvariableop_resource:2	B
4sequential_1_dense_5_biasadd_readvariableop_resource:	
identity��,sequential_1/conv1d_1/BiasAdd/ReadVariableOp�8sequential_1/conv1d_1/Conv1D/ExpandDims_1/ReadVariableOp�+sequential_1/dense_3/BiasAdd/ReadVariableOp�*sequential_1/dense_3/MatMul/ReadVariableOp�+sequential_1/dense_4/BiasAdd/ReadVariableOp�*sequential_1/dense_4/MatMul/ReadVariableOp�+sequential_1/dense_5/BiasAdd/ReadVariableOp�*sequential_1/dense_5/MatMul/ReadVariableOpv
+sequential_1/conv1d_1/Conv1D/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
'sequential_1/conv1d_1/Conv1D/ExpandDims
ExpandDimsconv1d_1_input4sequential_1/conv1d_1/Conv1D/ExpandDims/dim:output:0*
T0*/
_output_shapes
:���������	�
8sequential_1/conv1d_1/Conv1D/ExpandDims_1/ReadVariableOpReadVariableOpAsequential_1_conv1d_1_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:	*
dtype0o
-sequential_1/conv1d_1/Conv1D/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : �
)sequential_1/conv1d_1/Conv1D/ExpandDims_1
ExpandDims@sequential_1/conv1d_1/Conv1D/ExpandDims_1/ReadVariableOp:value:06sequential_1/conv1d_1/Conv1D/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:	�
sequential_1/conv1d_1/Conv1DConv2D0sequential_1/conv1d_1/Conv1D/ExpandDims:output:02sequential_1/conv1d_1/Conv1D/ExpandDims_1:output:0*
T0*/
_output_shapes
:���������*
paddingVALID*
strides
�
$sequential_1/conv1d_1/Conv1D/SqueezeSqueeze%sequential_1/conv1d_1/Conv1D:output:0*
T0*+
_output_shapes
:���������*
squeeze_dims

����������
,sequential_1/conv1d_1/BiasAdd/ReadVariableOpReadVariableOp5sequential_1_conv1d_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
sequential_1/conv1d_1/BiasAddBiasAdd-sequential_1/conv1d_1/Conv1D/Squeeze:output:04sequential_1/conv1d_1/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������~
sequential_1/conv1d_1/EluElu&sequential_1/conv1d_1/BiasAdd:output:0*
T0*+
_output_shapes
:����������
0sequential_1/conv1d_1/ActivityRegularizer/SquareSquare'sequential_1/conv1d_1/Elu:activations:0*
T0*+
_output_shapes
:����������
/sequential_1/conv1d_1/ActivityRegularizer/ConstConst*
_output_shapes
:*
dtype0*!
valueB"          �
-sequential_1/conv1d_1/ActivityRegularizer/SumSum4sequential_1/conv1d_1/ActivityRegularizer/Square:y:08sequential_1/conv1d_1/ActivityRegularizer/Const:output:0*
T0*
_output_shapes
: t
/sequential_1/conv1d_1/ActivityRegularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
-sequential_1/conv1d_1/ActivityRegularizer/mulMul8sequential_1/conv1d_1/ActivityRegularizer/mul/x:output:06sequential_1/conv1d_1/ActivityRegularizer/Sum:output:0*
T0*
_output_shapes
: �
/sequential_1/conv1d_1/ActivityRegularizer/ShapeShape'sequential_1/conv1d_1/Elu:activations:0*
T0*
_output_shapes
:�
=sequential_1/conv1d_1/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: �
?sequential_1/conv1d_1/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:�
?sequential_1/conv1d_1/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
7sequential_1/conv1d_1/ActivityRegularizer/strided_sliceStridedSlice8sequential_1/conv1d_1/ActivityRegularizer/Shape:output:0Fsequential_1/conv1d_1/ActivityRegularizer/strided_slice/stack:output:0Hsequential_1/conv1d_1/ActivityRegularizer/strided_slice/stack_1:output:0Hsequential_1/conv1d_1/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
.sequential_1/conv1d_1/ActivityRegularizer/CastCast@sequential_1/conv1d_1/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
1sequential_1/conv1d_1/ActivityRegularizer/truedivRealDiv1sequential_1/conv1d_1/ActivityRegularizer/mul:z:02sequential_1/conv1d_1/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: m
sequential_1/flatten_1/ConstConst*
_output_shapes
:*
dtype0*
valueB"�����   �
sequential_1/flatten_1/ReshapeReshape'sequential_1/conv1d_1/Elu:activations:0%sequential_1/flatten_1/Const:output:0*
T0*(
_output_shapes
:�����������
*sequential_1/dense_3/MatMul/ReadVariableOpReadVariableOp3sequential_1_dense_3_matmul_readvariableop_resource* 
_output_shapes
:
��*
dtype0�
sequential_1/dense_3/MatMulMatMul'sequential_1/flatten_1/Reshape:output:02sequential_1/dense_3/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
+sequential_1/dense_3/BiasAdd/ReadVariableOpReadVariableOp4sequential_1_dense_3_biasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0�
sequential_1/dense_3/BiasAddBiasAdd%sequential_1/dense_3/MatMul:product:03sequential_1/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������{
sequential_1/dense_3/ReluRelu%sequential_1/dense_3/BiasAdd:output:0*
T0*(
_output_shapes
:�����������
/sequential_1/dense_3/ActivityRegularizer/SquareSquare'sequential_1/dense_3/Relu:activations:0*
T0*(
_output_shapes
:����������
.sequential_1/dense_3/ActivityRegularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
,sequential_1/dense_3/ActivityRegularizer/SumSum3sequential_1/dense_3/ActivityRegularizer/Square:y:07sequential_1/dense_3/ActivityRegularizer/Const:output:0*
T0*
_output_shapes
: s
.sequential_1/dense_3/ActivityRegularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
,sequential_1/dense_3/ActivityRegularizer/mulMul7sequential_1/dense_3/ActivityRegularizer/mul/x:output:05sequential_1/dense_3/ActivityRegularizer/Sum:output:0*
T0*
_output_shapes
: �
.sequential_1/dense_3/ActivityRegularizer/ShapeShape'sequential_1/dense_3/Relu:activations:0*
T0*
_output_shapes
:�
<sequential_1/dense_3/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: �
>sequential_1/dense_3/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:�
>sequential_1/dense_3/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
6sequential_1/dense_3/ActivityRegularizer/strided_sliceStridedSlice7sequential_1/dense_3/ActivityRegularizer/Shape:output:0Esequential_1/dense_3/ActivityRegularizer/strided_slice/stack:output:0Gsequential_1/dense_3/ActivityRegularizer/strided_slice/stack_1:output:0Gsequential_1/dense_3/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
-sequential_1/dense_3/ActivityRegularizer/CastCast?sequential_1/dense_3/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
0sequential_1/dense_3/ActivityRegularizer/truedivRealDiv0sequential_1/dense_3/ActivityRegularizer/mul:z:01sequential_1/dense_3/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: �
sequential_1/dropout_1/IdentityIdentity'sequential_1/dense_3/Relu:activations:0*
T0*(
_output_shapes
:�����������
*sequential_1/dense_4/MatMul/ReadVariableOpReadVariableOp3sequential_1_dense_4_matmul_readvariableop_resource*
_output_shapes
:	�2*
dtype0�
sequential_1/dense_4/MatMulMatMul(sequential_1/dropout_1/Identity:output:02sequential_1/dense_4/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2�
+sequential_1/dense_4/BiasAdd/ReadVariableOpReadVariableOp4sequential_1_dense_4_biasadd_readvariableop_resource*
_output_shapes
:2*
dtype0�
sequential_1/dense_4/BiasAddBiasAdd%sequential_1/dense_4/MatMul:product:03sequential_1/dense_4/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2z
sequential_1/dense_4/ReluRelu%sequential_1/dense_4/BiasAdd:output:0*
T0*'
_output_shapes
:���������2�
/sequential_1/dense_4/ActivityRegularizer/SquareSquare'sequential_1/dense_4/Relu:activations:0*
T0*'
_output_shapes
:���������2
.sequential_1/dense_4/ActivityRegularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
,sequential_1/dense_4/ActivityRegularizer/SumSum3sequential_1/dense_4/ActivityRegularizer/Square:y:07sequential_1/dense_4/ActivityRegularizer/Const:output:0*
T0*
_output_shapes
: s
.sequential_1/dense_4/ActivityRegularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
,sequential_1/dense_4/ActivityRegularizer/mulMul7sequential_1/dense_4/ActivityRegularizer/mul/x:output:05sequential_1/dense_4/ActivityRegularizer/Sum:output:0*
T0*
_output_shapes
: �
.sequential_1/dense_4/ActivityRegularizer/ShapeShape'sequential_1/dense_4/Relu:activations:0*
T0*
_output_shapes
:�
<sequential_1/dense_4/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: �
>sequential_1/dense_4/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:�
>sequential_1/dense_4/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
6sequential_1/dense_4/ActivityRegularizer/strided_sliceStridedSlice7sequential_1/dense_4/ActivityRegularizer/Shape:output:0Esequential_1/dense_4/ActivityRegularizer/strided_slice/stack:output:0Gsequential_1/dense_4/ActivityRegularizer/strided_slice/stack_1:output:0Gsequential_1/dense_4/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
-sequential_1/dense_4/ActivityRegularizer/CastCast?sequential_1/dense_4/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
0sequential_1/dense_4/ActivityRegularizer/truedivRealDiv0sequential_1/dense_4/ActivityRegularizer/mul:z:01sequential_1/dense_4/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: �
*sequential_1/dense_5/MatMul/ReadVariableOpReadVariableOp3sequential_1_dense_5_matmul_readvariableop_resource*
_output_shapes

:2	*
dtype0�
sequential_1/dense_5/MatMulMatMul'sequential_1/dense_4/Relu:activations:02sequential_1/dense_5/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������	�
+sequential_1/dense_5/BiasAdd/ReadVariableOpReadVariableOp4sequential_1_dense_5_biasadd_readvariableop_resource*
_output_shapes
:	*
dtype0�
sequential_1/dense_5/BiasAddBiasAdd%sequential_1/dense_5/MatMul:product:03sequential_1/dense_5/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������	�
/sequential_1/dense_5/ActivityRegularizer/SquareSquare%sequential_1/dense_5/BiasAdd:output:0*
T0*'
_output_shapes
:���������	
.sequential_1/dense_5/ActivityRegularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
,sequential_1/dense_5/ActivityRegularizer/SumSum3sequential_1/dense_5/ActivityRegularizer/Square:y:07sequential_1/dense_5/ActivityRegularizer/Const:output:0*
T0*
_output_shapes
: s
.sequential_1/dense_5/ActivityRegularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
,sequential_1/dense_5/ActivityRegularizer/mulMul7sequential_1/dense_5/ActivityRegularizer/mul/x:output:05sequential_1/dense_5/ActivityRegularizer/Sum:output:0*
T0*
_output_shapes
: �
.sequential_1/dense_5/ActivityRegularizer/ShapeShape%sequential_1/dense_5/BiasAdd:output:0*
T0*
_output_shapes
:�
<sequential_1/dense_5/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: �
>sequential_1/dense_5/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:�
>sequential_1/dense_5/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
6sequential_1/dense_5/ActivityRegularizer/strided_sliceStridedSlice7sequential_1/dense_5/ActivityRegularizer/Shape:output:0Esequential_1/dense_5/ActivityRegularizer/strided_slice/stack:output:0Gsequential_1/dense_5/ActivityRegularizer/strided_slice/stack_1:output:0Gsequential_1/dense_5/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
-sequential_1/dense_5/ActivityRegularizer/CastCast?sequential_1/dense_5/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
0sequential_1/dense_5/ActivityRegularizer/truedivRealDiv0sequential_1/dense_5/ActivityRegularizer/mul:z:01sequential_1/dense_5/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: �
sequential_1/softmax_1/SoftmaxSoftmax%sequential_1/dense_5/BiasAdd:output:0*
T0*'
_output_shapes
:���������	w
IdentityIdentity(sequential_1/softmax_1/Softmax:softmax:0^NoOp*
T0*'
_output_shapes
:���������	�
NoOpNoOp-^sequential_1/conv1d_1/BiasAdd/ReadVariableOp9^sequential_1/conv1d_1/Conv1D/ExpandDims_1/ReadVariableOp,^sequential_1/dense_3/BiasAdd/ReadVariableOp+^sequential_1/dense_3/MatMul/ReadVariableOp,^sequential_1/dense_4/BiasAdd/ReadVariableOp+^sequential_1/dense_4/MatMul/ReadVariableOp,^sequential_1/dense_5/BiasAdd/ReadVariableOp+^sequential_1/dense_5/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������	: : : : : : : : 2\
,sequential_1/conv1d_1/BiasAdd/ReadVariableOp,sequential_1/conv1d_1/BiasAdd/ReadVariableOp2t
8sequential_1/conv1d_1/Conv1D/ExpandDims_1/ReadVariableOp8sequential_1/conv1d_1/Conv1D/ExpandDims_1/ReadVariableOp2Z
+sequential_1/dense_3/BiasAdd/ReadVariableOp+sequential_1/dense_3/BiasAdd/ReadVariableOp2X
*sequential_1/dense_3/MatMul/ReadVariableOp*sequential_1/dense_3/MatMul/ReadVariableOp2Z
+sequential_1/dense_4/BiasAdd/ReadVariableOp+sequential_1/dense_4/BiasAdd/ReadVariableOp2X
*sequential_1/dense_4/MatMul/ReadVariableOp*sequential_1/dense_4/MatMul/ReadVariableOp2Z
+sequential_1/dense_5/BiasAdd/ReadVariableOp+sequential_1/dense_5/BiasAdd/ReadVariableOp2X
*sequential_1/dense_5/MatMul/ReadVariableOp*sequential_1/dense_5/MatMul/ReadVariableOp:[ W
+
_output_shapes
:���������	
(
_user_specified_nameconv1d_1_input
�z
�
J__inference_sequential_1_layer_call_and_return_conditional_losses_17902530

inputs'
conv1d_1_17902368:	
conv1d_1_17902370:$
dense_3_17902407:
��
dense_3_17902409:	�#
dense_4_17902445:	�2
dense_4_17902447:2"
dense_5_17902475:2	
dense_5_17902477:	
identity

identity_1

identity_2

identity_3

identity_4�� conv1d_1/StatefulPartitionedCall�/conv1d_1/bias/Regularizer/Square/ReadVariableOp�1conv1d_1/kernel/Regularizer/Square/ReadVariableOp�dense_3/StatefulPartitionedCall�.dense_3/bias/Regularizer/Square/ReadVariableOp�dense_4/StatefulPartitionedCall�.dense_4/bias/Regularizer/Square/ReadVariableOp�dense_5/StatefulPartitionedCall�.dense_5/bias/Regularizer/Square/ReadVariableOp�
 conv1d_1/StatefulPartitionedCallStatefulPartitionedCallinputsconv1d_1_17902368conv1d_1_17902370*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *O
fJRH
F__inference_conv1d_1_layer_call_and_return_conditional_losses_17902367�
,conv1d_1/ActivityRegularizer/PartitionedCallPartitionedCall)conv1d_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *;
f6R4
2__inference_conv1d_1_activity_regularizer_17902293{
"conv1d_1/ActivityRegularizer/ShapeShape)conv1d_1/StatefulPartitionedCall:output:0*
T0*
_output_shapes
:z
0conv1d_1/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: |
2conv1d_1/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:|
2conv1d_1/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
*conv1d_1/ActivityRegularizer/strided_sliceStridedSlice+conv1d_1/ActivityRegularizer/Shape:output:09conv1d_1/ActivityRegularizer/strided_slice/stack:output:0;conv1d_1/ActivityRegularizer/strided_slice/stack_1:output:0;conv1d_1/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
!conv1d_1/ActivityRegularizer/CastCast3conv1d_1/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
$conv1d_1/ActivityRegularizer/truedivRealDiv5conv1d_1/ActivityRegularizer/PartitionedCall:output:0%conv1d_1/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: �
flatten_1/PartitionedCallPartitionedCall)conv1d_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *P
fKRI
G__inference_flatten_1_layer_call_and_return_conditional_losses_17902387�
dense_3/StatefulPartitionedCallStatefulPartitionedCall"flatten_1/PartitionedCall:output:0dense_3_17902407dense_3_17902409*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *N
fIRG
E__inference_dense_3_layer_call_and_return_conditional_losses_17902406�
+dense_3/ActivityRegularizer/PartitionedCallPartitionedCall(dense_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *:
f5R3
1__inference_dense_3_activity_regularizer_17902306y
!dense_3/ActivityRegularizer/ShapeShape(dense_3/StatefulPartitionedCall:output:0*
T0*
_output_shapes
:y
/dense_3/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: {
1dense_3/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1dense_3/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)dense_3/ActivityRegularizer/strided_sliceStridedSlice*dense_3/ActivityRegularizer/Shape:output:08dense_3/ActivityRegularizer/strided_slice/stack:output:0:dense_3/ActivityRegularizer/strided_slice/stack_1:output:0:dense_3/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
 dense_3/ActivityRegularizer/CastCast2dense_3/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
#dense_3/ActivityRegularizer/truedivRealDiv4dense_3/ActivityRegularizer/PartitionedCall:output:0$dense_3/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: �
dropout_1/PartitionedCallPartitionedCall(dense_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *P
fKRI
G__inference_dropout_1_layer_call_and_return_conditional_losses_17902425�
dense_4/StatefulPartitionedCallStatefulPartitionedCall"dropout_1/PartitionedCall:output:0dense_4_17902445dense_4_17902447*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *N
fIRG
E__inference_dense_4_layer_call_and_return_conditional_losses_17902444�
+dense_4/ActivityRegularizer/PartitionedCallPartitionedCall(dense_4/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *:
f5R3
1__inference_dense_4_activity_regularizer_17902319y
!dense_4/ActivityRegularizer/ShapeShape(dense_4/StatefulPartitionedCall:output:0*
T0*
_output_shapes
:y
/dense_4/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: {
1dense_4/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1dense_4/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)dense_4/ActivityRegularizer/strided_sliceStridedSlice*dense_4/ActivityRegularizer/Shape:output:08dense_4/ActivityRegularizer/strided_slice/stack:output:0:dense_4/ActivityRegularizer/strided_slice/stack_1:output:0:dense_4/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
 dense_4/ActivityRegularizer/CastCast2dense_4/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
#dense_4/ActivityRegularizer/truedivRealDiv4dense_4/ActivityRegularizer/PartitionedCall:output:0$dense_4/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: �
dense_5/StatefulPartitionedCallStatefulPartitionedCall(dense_4/StatefulPartitionedCall:output:0dense_5_17902475dense_5_17902477*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������	*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *N
fIRG
E__inference_dense_5_layer_call_and_return_conditional_losses_17902474�
+dense_5/ActivityRegularizer/PartitionedCallPartitionedCall(dense_5/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *:
f5R3
1__inference_dense_5_activity_regularizer_17902332y
!dense_5/ActivityRegularizer/ShapeShape(dense_5/StatefulPartitionedCall:output:0*
T0*
_output_shapes
:y
/dense_5/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: {
1dense_5/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1dense_5/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)dense_5/ActivityRegularizer/strided_sliceStridedSlice*dense_5/ActivityRegularizer/Shape:output:08dense_5/ActivityRegularizer/strided_slice/stack:output:0:dense_5/ActivityRegularizer/strided_slice/stack_1:output:0:dense_5/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
 dense_5/ActivityRegularizer/CastCast2dense_5/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
#dense_5/ActivityRegularizer/truedivRealDiv4dense_5/ActivityRegularizer/PartitionedCall:output:0$dense_5/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: �
softmax_1/PartitionedCallPartitionedCall(dense_5/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������	* 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *P
fKRI
G__inference_softmax_1_layer_call_and_return_conditional_losses_17902493�
1conv1d_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv1d_1_17902368*"
_output_shapes
:	*
dtype0�
"conv1d_1/kernel/Regularizer/SquareSquare9conv1d_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*"
_output_shapes
:	v
!conv1d_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*!
valueB"          �
conv1d_1/kernel/Regularizer/SumSum&conv1d_1/kernel/Regularizer/Square:y:0*conv1d_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: f
!conv1d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
conv1d_1/kernel/Regularizer/mulMul*conv1d_1/kernel/Regularizer/mul/x:output:0(conv1d_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: }
/conv1d_1/bias/Regularizer/Square/ReadVariableOpReadVariableOpconv1d_1_17902370*
_output_shapes
:*
dtype0�
 conv1d_1/bias/Regularizer/SquareSquare7conv1d_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:i
conv1d_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
conv1d_1/bias/Regularizer/SumSum$conv1d_1/bias/Regularizer/Square:y:0(conv1d_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: d
conv1d_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
conv1d_1/bias/Regularizer/mulMul(conv1d_1/bias/Regularizer/mul/x:output:0&conv1d_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: |
.dense_3/bias/Regularizer/Square/ReadVariableOpReadVariableOpdense_3_17902409*
_output_shapes	
:�*
dtype0�
dense_3/bias/Regularizer/SquareSquare6dense_3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes	
:�h
dense_3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_3/bias/Regularizer/SumSum#dense_3/bias/Regularizer/Square:y:0'dense_3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_3/bias/Regularizer/mulMul'dense_3/bias/Regularizer/mul/x:output:0%dense_3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: {
.dense_4/bias/Regularizer/Square/ReadVariableOpReadVariableOpdense_4_17902447*
_output_shapes
:2*
dtype0�
dense_4/bias/Regularizer/SquareSquare6dense_4/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2h
dense_4/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_4/bias/Regularizer/SumSum#dense_4/bias/Regularizer/Square:y:0'dense_4/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_4/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_4/bias/Regularizer/mulMul'dense_4/bias/Regularizer/mul/x:output:0%dense_4/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: {
.dense_5/bias/Regularizer/Square/ReadVariableOpReadVariableOpdense_5_17902477*
_output_shapes
:	*
dtype0�
dense_5/bias/Regularizer/SquareSquare6dense_5/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	h
dense_5/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_5/bias/Regularizer/SumSum#dense_5/bias/Regularizer/Square:y:0'dense_5/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_5/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_5/bias/Regularizer/mulMul'dense_5/bias/Regularizer/mul/x:output:0%dense_5/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: q
IdentityIdentity"softmax_1/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������	h

Identity_1Identity(conv1d_1/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: g

Identity_2Identity'dense_3/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: g

Identity_3Identity'dense_4/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: g

Identity_4Identity'dense_5/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp!^conv1d_1/StatefulPartitionedCall0^conv1d_1/bias/Regularizer/Square/ReadVariableOp2^conv1d_1/kernel/Regularizer/Square/ReadVariableOp ^dense_3/StatefulPartitionedCall/^dense_3/bias/Regularizer/Square/ReadVariableOp ^dense_4/StatefulPartitionedCall/^dense_4/bias/Regularizer/Square/ReadVariableOp ^dense_5/StatefulPartitionedCall/^dense_5/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0"!

identity_3Identity_3:output:0"!

identity_4Identity_4:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������	: : : : : : : : 2D
 conv1d_1/StatefulPartitionedCall conv1d_1/StatefulPartitionedCall2b
/conv1d_1/bias/Regularizer/Square/ReadVariableOp/conv1d_1/bias/Regularizer/Square/ReadVariableOp2f
1conv1d_1/kernel/Regularizer/Square/ReadVariableOp1conv1d_1/kernel/Regularizer/Square/ReadVariableOp2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2`
.dense_3/bias/Regularizer/Square/ReadVariableOp.dense_3/bias/Regularizer/Square/ReadVariableOp2B
dense_4/StatefulPartitionedCalldense_4/StatefulPartitionedCall2`
.dense_4/bias/Regularizer/Square/ReadVariableOp.dense_4/bias/Regularizer/Square/ReadVariableOp2B
dense_5/StatefulPartitionedCalldense_5/StatefulPartitionedCall2`
.dense_5/bias/Regularizer/Square/ReadVariableOp.dense_5/bias/Regularizer/Square/ReadVariableOp:S O
+
_output_shapes
:���������	
 
_user_specified_nameinputs
�	
�
/__inference_sequential_1_layer_call_fn_17903144

inputs
unknown:	
	unknown_0:
	unknown_1:
��
	unknown_2:	�
	unknown_3:	�2
	unknown_4:2
	unknown_5:2	
	unknown_6:	
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout	
2*
_collective_manager_ids
 */
_output_shapes
:���������	: : : : **
_read_only_resource_inputs

*8
config_proto(&

CPU

GPU2*0J

 �AE8� *S
fNRL
J__inference_sequential_1_layer_call_and_return_conditional_losses_17902530o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������	: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:���������	
 
_user_specified_nameinputs
�	
f
G__inference_dropout_1_layer_call_and_return_conditional_losses_17903543

inputs
identity�R
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *���?e
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:����������C
dropout/ShapeShapeinputs*
T0*
_output_shapes
:�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:����������*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *
ף<�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:����������p
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:����������j
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:����������Z
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
I
2__inference_conv1d_1_activity_regularizer_17902293
x
identity6
SquareSquarex*
T0*
_output_shapes
:9
RankRank
Square:y:0*
T0*
_output_shapes
: M
range/startConst*
_output_shapes
: *
dtype0*
value	B : M
range/deltaConst*
_output_shapes
: *
dtype0*
value	B :n
rangeRangerange/start:output:0Rank:output:0range/delta:output:0*#
_output_shapes
:���������G
SumSum
Square:y:0range:output:0*
T0*
_output_shapes
: J
mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    I
mulMulmul/x:output:0Sum:output:0*
T0*
_output_shapes
: >
IdentityIdentitymul:z:0*
T0*
_output_shapes
: "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
::; 7

_output_shapes
:

_user_specified_namex
�
H
,__inference_dropout_1_layer_call_fn_17903521

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *P
fKRI
G__inference_dropout_1_layer_call_and_return_conditional_losses_17902425a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
E__inference_dense_3_layer_call_and_return_conditional_losses_17903516

inputs2
matmul_readvariableop_resource:
��.
biasadd_readvariableop_resource:	�
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�.dense_3/bias/Regularizer/Square/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
��*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������Q
ReluReluBiasAdd:output:0*
T0*(
_output_shapes
:�����������
.dense_3/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0�
dense_3/bias/Regularizer/SquareSquare6dense_3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes	
:�h
dense_3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_3/bias/Regularizer/SumSum#dense_3/bias/Regularizer/Square:y:0'dense_3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_3/bias/Regularizer/mulMul'dense_3/bias/Regularizer/mul/x:output:0%dense_3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: b
IdentityIdentityRelu:activations:0^NoOp*
T0*(
_output_shapes
:�����������
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp/^dense_3/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2`
.dense_3/bias/Regularizer/Square/ReadVariableOp.dense_3/bias/Regularizer/Square/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�	
f
G__inference_dropout_1_layer_call_and_return_conditional_losses_17902623

inputs
identity�R
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *���?e
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:����������C
dropout/ShapeShapeinputs*
T0*
_output_shapes
:�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:����������*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *
ף<�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:����������p
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:����������j
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:����������Z
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�z
�
J__inference_sequential_1_layer_call_and_return_conditional_losses_17902937
conv1d_1_input'
conv1d_1_17902847:	
conv1d_1_17902849:$
dense_3_17902861:
��
dense_3_17902863:	�#
dense_4_17902875:	�2
dense_4_17902877:2"
dense_5_17902888:2	
dense_5_17902890:	
identity

identity_1

identity_2

identity_3

identity_4�� conv1d_1/StatefulPartitionedCall�/conv1d_1/bias/Regularizer/Square/ReadVariableOp�1conv1d_1/kernel/Regularizer/Square/ReadVariableOp�dense_3/StatefulPartitionedCall�.dense_3/bias/Regularizer/Square/ReadVariableOp�dense_4/StatefulPartitionedCall�.dense_4/bias/Regularizer/Square/ReadVariableOp�dense_5/StatefulPartitionedCall�.dense_5/bias/Regularizer/Square/ReadVariableOp�
 conv1d_1/StatefulPartitionedCallStatefulPartitionedCallconv1d_1_inputconv1d_1_17902847conv1d_1_17902849*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *O
fJRH
F__inference_conv1d_1_layer_call_and_return_conditional_losses_17902367�
,conv1d_1/ActivityRegularizer/PartitionedCallPartitionedCall)conv1d_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *;
f6R4
2__inference_conv1d_1_activity_regularizer_17902293{
"conv1d_1/ActivityRegularizer/ShapeShape)conv1d_1/StatefulPartitionedCall:output:0*
T0*
_output_shapes
:z
0conv1d_1/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: |
2conv1d_1/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:|
2conv1d_1/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
*conv1d_1/ActivityRegularizer/strided_sliceStridedSlice+conv1d_1/ActivityRegularizer/Shape:output:09conv1d_1/ActivityRegularizer/strided_slice/stack:output:0;conv1d_1/ActivityRegularizer/strided_slice/stack_1:output:0;conv1d_1/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
!conv1d_1/ActivityRegularizer/CastCast3conv1d_1/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
$conv1d_1/ActivityRegularizer/truedivRealDiv5conv1d_1/ActivityRegularizer/PartitionedCall:output:0%conv1d_1/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: �
flatten_1/PartitionedCallPartitionedCall)conv1d_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *P
fKRI
G__inference_flatten_1_layer_call_and_return_conditional_losses_17902387�
dense_3/StatefulPartitionedCallStatefulPartitionedCall"flatten_1/PartitionedCall:output:0dense_3_17902861dense_3_17902863*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *N
fIRG
E__inference_dense_3_layer_call_and_return_conditional_losses_17902406�
+dense_3/ActivityRegularizer/PartitionedCallPartitionedCall(dense_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *:
f5R3
1__inference_dense_3_activity_regularizer_17902306y
!dense_3/ActivityRegularizer/ShapeShape(dense_3/StatefulPartitionedCall:output:0*
T0*
_output_shapes
:y
/dense_3/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: {
1dense_3/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1dense_3/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)dense_3/ActivityRegularizer/strided_sliceStridedSlice*dense_3/ActivityRegularizer/Shape:output:08dense_3/ActivityRegularizer/strided_slice/stack:output:0:dense_3/ActivityRegularizer/strided_slice/stack_1:output:0:dense_3/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
 dense_3/ActivityRegularizer/CastCast2dense_3/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
#dense_3/ActivityRegularizer/truedivRealDiv4dense_3/ActivityRegularizer/PartitionedCall:output:0$dense_3/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: �
dropout_1/PartitionedCallPartitionedCall(dense_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *P
fKRI
G__inference_dropout_1_layer_call_and_return_conditional_losses_17902425�
dense_4/StatefulPartitionedCallStatefulPartitionedCall"dropout_1/PartitionedCall:output:0dense_4_17902875dense_4_17902877*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *N
fIRG
E__inference_dense_4_layer_call_and_return_conditional_losses_17902444�
+dense_4/ActivityRegularizer/PartitionedCallPartitionedCall(dense_4/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *:
f5R3
1__inference_dense_4_activity_regularizer_17902319y
!dense_4/ActivityRegularizer/ShapeShape(dense_4/StatefulPartitionedCall:output:0*
T0*
_output_shapes
:y
/dense_4/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: {
1dense_4/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1dense_4/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)dense_4/ActivityRegularizer/strided_sliceStridedSlice*dense_4/ActivityRegularizer/Shape:output:08dense_4/ActivityRegularizer/strided_slice/stack:output:0:dense_4/ActivityRegularizer/strided_slice/stack_1:output:0:dense_4/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
 dense_4/ActivityRegularizer/CastCast2dense_4/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
#dense_4/ActivityRegularizer/truedivRealDiv4dense_4/ActivityRegularizer/PartitionedCall:output:0$dense_4/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: �
dense_5/StatefulPartitionedCallStatefulPartitionedCall(dense_4/StatefulPartitionedCall:output:0dense_5_17902888dense_5_17902890*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������	*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *N
fIRG
E__inference_dense_5_layer_call_and_return_conditional_losses_17902474�
+dense_5/ActivityRegularizer/PartitionedCallPartitionedCall(dense_5/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *:
f5R3
1__inference_dense_5_activity_regularizer_17902332y
!dense_5/ActivityRegularizer/ShapeShape(dense_5/StatefulPartitionedCall:output:0*
T0*
_output_shapes
:y
/dense_5/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: {
1dense_5/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1dense_5/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)dense_5/ActivityRegularizer/strided_sliceStridedSlice*dense_5/ActivityRegularizer/Shape:output:08dense_5/ActivityRegularizer/strided_slice/stack:output:0:dense_5/ActivityRegularizer/strided_slice/stack_1:output:0:dense_5/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
 dense_5/ActivityRegularizer/CastCast2dense_5/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
#dense_5/ActivityRegularizer/truedivRealDiv4dense_5/ActivityRegularizer/PartitionedCall:output:0$dense_5/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: �
softmax_1/PartitionedCallPartitionedCall(dense_5/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������	* 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *P
fKRI
G__inference_softmax_1_layer_call_and_return_conditional_losses_17902493�
1conv1d_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv1d_1_17902847*"
_output_shapes
:	*
dtype0�
"conv1d_1/kernel/Regularizer/SquareSquare9conv1d_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*"
_output_shapes
:	v
!conv1d_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*!
valueB"          �
conv1d_1/kernel/Regularizer/SumSum&conv1d_1/kernel/Regularizer/Square:y:0*conv1d_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: f
!conv1d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
conv1d_1/kernel/Regularizer/mulMul*conv1d_1/kernel/Regularizer/mul/x:output:0(conv1d_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: }
/conv1d_1/bias/Regularizer/Square/ReadVariableOpReadVariableOpconv1d_1_17902849*
_output_shapes
:*
dtype0�
 conv1d_1/bias/Regularizer/SquareSquare7conv1d_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:i
conv1d_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
conv1d_1/bias/Regularizer/SumSum$conv1d_1/bias/Regularizer/Square:y:0(conv1d_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: d
conv1d_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
conv1d_1/bias/Regularizer/mulMul(conv1d_1/bias/Regularizer/mul/x:output:0&conv1d_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: |
.dense_3/bias/Regularizer/Square/ReadVariableOpReadVariableOpdense_3_17902863*
_output_shapes	
:�*
dtype0�
dense_3/bias/Regularizer/SquareSquare6dense_3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes	
:�h
dense_3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_3/bias/Regularizer/SumSum#dense_3/bias/Regularizer/Square:y:0'dense_3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_3/bias/Regularizer/mulMul'dense_3/bias/Regularizer/mul/x:output:0%dense_3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: {
.dense_4/bias/Regularizer/Square/ReadVariableOpReadVariableOpdense_4_17902877*
_output_shapes
:2*
dtype0�
dense_4/bias/Regularizer/SquareSquare6dense_4/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2h
dense_4/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_4/bias/Regularizer/SumSum#dense_4/bias/Regularizer/Square:y:0'dense_4/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_4/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_4/bias/Regularizer/mulMul'dense_4/bias/Regularizer/mul/x:output:0%dense_4/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: {
.dense_5/bias/Regularizer/Square/ReadVariableOpReadVariableOpdense_5_17902890*
_output_shapes
:	*
dtype0�
dense_5/bias/Regularizer/SquareSquare6dense_5/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	h
dense_5/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_5/bias/Regularizer/SumSum#dense_5/bias/Regularizer/Square:y:0'dense_5/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_5/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_5/bias/Regularizer/mulMul'dense_5/bias/Regularizer/mul/x:output:0%dense_5/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: q
IdentityIdentity"softmax_1/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������	h

Identity_1Identity(conv1d_1/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: g

Identity_2Identity'dense_3/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: g

Identity_3Identity'dense_4/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: g

Identity_4Identity'dense_5/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp!^conv1d_1/StatefulPartitionedCall0^conv1d_1/bias/Regularizer/Square/ReadVariableOp2^conv1d_1/kernel/Regularizer/Square/ReadVariableOp ^dense_3/StatefulPartitionedCall/^dense_3/bias/Regularizer/Square/ReadVariableOp ^dense_4/StatefulPartitionedCall/^dense_4/bias/Regularizer/Square/ReadVariableOp ^dense_5/StatefulPartitionedCall/^dense_5/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0"!

identity_3Identity_3:output:0"!

identity_4Identity_4:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������	: : : : : : : : 2D
 conv1d_1/StatefulPartitionedCall conv1d_1/StatefulPartitionedCall2b
/conv1d_1/bias/Regularizer/Square/ReadVariableOp/conv1d_1/bias/Regularizer/Square/ReadVariableOp2f
1conv1d_1/kernel/Regularizer/Square/ReadVariableOp1conv1d_1/kernel/Regularizer/Square/ReadVariableOp2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2`
.dense_3/bias/Regularizer/Square/ReadVariableOp.dense_3/bias/Regularizer/Square/ReadVariableOp2B
dense_4/StatefulPartitionedCalldense_4/StatefulPartitionedCall2`
.dense_4/bias/Regularizer/Square/ReadVariableOp.dense_4/bias/Regularizer/Square/ReadVariableOp2B
dense_5/StatefulPartitionedCalldense_5/StatefulPartitionedCall2`
.dense_5/bias/Regularizer/Square/ReadVariableOp.dense_5/bias/Regularizer/Square/ReadVariableOp:[ W
+
_output_shapes
:���������	
(
_user_specified_nameconv1d_1_input
�

�
/__inference_sequential_1_layer_call_fn_17902553
conv1d_1_input
unknown:	
	unknown_0:
	unknown_1:
��
	unknown_2:	�
	unknown_3:	�2
	unknown_4:2
	unknown_5:2	
	unknown_6:	
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallconv1d_1_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout	
2*
_collective_manager_ids
 */
_output_shapes
:���������	: : : : **
_read_only_resource_inputs

*8
config_proto(&

CPU

GPU2*0J

 �AE8� *S
fNRL
J__inference_sequential_1_layer_call_and_return_conditional_losses_17902530o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������	: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
+
_output_shapes
:���������	
(
_user_specified_nameconv1d_1_input
�

�
__inference_loss_fn_3_17903670E
7dense_4_bias_regularizer_square_readvariableop_resource:2
identity��.dense_4/bias/Regularizer/Square/ReadVariableOp�
.dense_4/bias/Regularizer/Square/ReadVariableOpReadVariableOp7dense_4_bias_regularizer_square_readvariableop_resource*
_output_shapes
:2*
dtype0�
dense_4/bias/Regularizer/SquareSquare6dense_4/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2h
dense_4/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_4/bias/Regularizer/SumSum#dense_4/bias/Regularizer/Square:y:0'dense_4/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_4/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_4/bias/Regularizer/mulMul'dense_4/bias/Regularizer/mul/x:output:0%dense_4/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: ^
IdentityIdentity dense_4/bias/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: w
NoOpNoOp/^dense_4/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2`
.dense_4/bias/Regularizer/Square/ReadVariableOp.dense_4/bias/Regularizer/Square/ReadVariableOp
�
�
E__inference_dense_3_layer_call_and_return_conditional_losses_17902406

inputs2
matmul_readvariableop_resource:
��.
biasadd_readvariableop_resource:	�
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�.dense_3/bias/Regularizer/Square/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
��*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������Q
ReluReluBiasAdd:output:0*
T0*(
_output_shapes
:�����������
.dense_3/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0�
dense_3/bias/Regularizer/SquareSquare6dense_3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes	
:�h
dense_3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_3/bias/Regularizer/SumSum#dense_3/bias/Regularizer/Square:y:0'dense_3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_3/bias/Regularizer/mulMul'dense_3/bias/Regularizer/mul/x:output:0%dense_3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: b
IdentityIdentityRelu:activations:0^NoOp*
T0*(
_output_shapes
:�����������
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp/^dense_3/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2`
.dense_3/bias/Regularizer/Square/ReadVariableOp.dense_3/bias/Regularizer/Square/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
e
,__inference_dropout_1_layer_call_fn_17903526

inputs
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *P
fKRI
G__inference_dropout_1_layer_call_and_return_conditional_losses_17902623p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:����������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
c
G__inference_softmax_1_layer_call_and_return_conditional_losses_17902493

inputs
identityL
SoftmaxSoftmaxinputs*
T0*'
_output_shapes
:���������	Y
IdentityIdentitySoftmax:softmax:0*
T0*'
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������	:O K
'
_output_shapes
:���������	
 
_user_specified_nameinputs
�
H
1__inference_dense_4_activity_regularizer_17902319
x
identity6
SquareSquarex*
T0*
_output_shapes
:9
RankRank
Square:y:0*
T0*
_output_shapes
: M
range/startConst*
_output_shapes
: *
dtype0*
value	B : M
range/deltaConst*
_output_shapes
: *
dtype0*
value	B :n
rangeRangerange/start:output:0Rank:output:0range/delta:output:0*#
_output_shapes
:���������G
SumSum
Square:y:0range:output:0*
T0*
_output_shapes
: J
mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    I
mulMulmul/x:output:0Sum:output:0*
T0*
_output_shapes
: >
IdentityIdentitymul:z:0*
T0*
_output_shapes
: "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
::; 7

_output_shapes
:

_user_specified_namex
�
�
*__inference_dense_3_layer_call_fn_17903488

inputs
unknown:
��
	unknown_0:	�
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *N
fIRG
E__inference_dense_3_layer_call_and_return_conditional_losses_17902406p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:����������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
e
G__inference_dropout_1_layer_call_and_return_conditional_losses_17902425

inputs

identity_1O
IdentityIdentityinputs*
T0*(
_output_shapes
:����������\

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:����������"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
Ò
�	
J__inference_sequential_1_layer_call_and_return_conditional_losses_17903291

inputsJ
4conv1d_1_conv1d_expanddims_1_readvariableop_resource:	6
(conv1d_1_biasadd_readvariableop_resource::
&dense_3_matmul_readvariableop_resource:
��6
'dense_3_biasadd_readvariableop_resource:	�9
&dense_4_matmul_readvariableop_resource:	�25
'dense_4_biasadd_readvariableop_resource:28
&dense_5_matmul_readvariableop_resource:2	5
'dense_5_biasadd_readvariableop_resource:	
identity

identity_1

identity_2

identity_3

identity_4��conv1d_1/BiasAdd/ReadVariableOp�+conv1d_1/Conv1D/ExpandDims_1/ReadVariableOp�/conv1d_1/bias/Regularizer/Square/ReadVariableOp�1conv1d_1/kernel/Regularizer/Square/ReadVariableOp�dense_3/BiasAdd/ReadVariableOp�dense_3/MatMul/ReadVariableOp�.dense_3/bias/Regularizer/Square/ReadVariableOp�dense_4/BiasAdd/ReadVariableOp�dense_4/MatMul/ReadVariableOp�.dense_4/bias/Regularizer/Square/ReadVariableOp�dense_5/BiasAdd/ReadVariableOp�dense_5/MatMul/ReadVariableOp�.dense_5/bias/Regularizer/Square/ReadVariableOpi
conv1d_1/Conv1D/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
conv1d_1/Conv1D/ExpandDims
ExpandDimsinputs'conv1d_1/Conv1D/ExpandDims/dim:output:0*
T0*/
_output_shapes
:���������	�
+conv1d_1/Conv1D/ExpandDims_1/ReadVariableOpReadVariableOp4conv1d_1_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:	*
dtype0b
 conv1d_1/Conv1D/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : �
conv1d_1/Conv1D/ExpandDims_1
ExpandDims3conv1d_1/Conv1D/ExpandDims_1/ReadVariableOp:value:0)conv1d_1/Conv1D/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:	�
conv1d_1/Conv1DConv2D#conv1d_1/Conv1D/ExpandDims:output:0%conv1d_1/Conv1D/ExpandDims_1:output:0*
T0*/
_output_shapes
:���������*
paddingVALID*
strides
�
conv1d_1/Conv1D/SqueezeSqueezeconv1d_1/Conv1D:output:0*
T0*+
_output_shapes
:���������*
squeeze_dims

����������
conv1d_1/BiasAdd/ReadVariableOpReadVariableOp(conv1d_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
conv1d_1/BiasAddBiasAdd conv1d_1/Conv1D/Squeeze:output:0'conv1d_1/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������d
conv1d_1/EluEluconv1d_1/BiasAdd:output:0*
T0*+
_output_shapes
:���������
#conv1d_1/ActivityRegularizer/SquareSquareconv1d_1/Elu:activations:0*
T0*+
_output_shapes
:���������w
"conv1d_1/ActivityRegularizer/ConstConst*
_output_shapes
:*
dtype0*!
valueB"          �
 conv1d_1/ActivityRegularizer/SumSum'conv1d_1/ActivityRegularizer/Square:y:0+conv1d_1/ActivityRegularizer/Const:output:0*
T0*
_output_shapes
: g
"conv1d_1/ActivityRegularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
 conv1d_1/ActivityRegularizer/mulMul+conv1d_1/ActivityRegularizer/mul/x:output:0)conv1d_1/ActivityRegularizer/Sum:output:0*
T0*
_output_shapes
: l
"conv1d_1/ActivityRegularizer/ShapeShapeconv1d_1/Elu:activations:0*
T0*
_output_shapes
:z
0conv1d_1/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: |
2conv1d_1/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:|
2conv1d_1/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
*conv1d_1/ActivityRegularizer/strided_sliceStridedSlice+conv1d_1/ActivityRegularizer/Shape:output:09conv1d_1/ActivityRegularizer/strided_slice/stack:output:0;conv1d_1/ActivityRegularizer/strided_slice/stack_1:output:0;conv1d_1/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
!conv1d_1/ActivityRegularizer/CastCast3conv1d_1/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
$conv1d_1/ActivityRegularizer/truedivRealDiv$conv1d_1/ActivityRegularizer/mul:z:0%conv1d_1/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: `
flatten_1/ConstConst*
_output_shapes
:*
dtype0*
valueB"�����   �
flatten_1/ReshapeReshapeconv1d_1/Elu:activations:0flatten_1/Const:output:0*
T0*(
_output_shapes
:�����������
dense_3/MatMul/ReadVariableOpReadVariableOp&dense_3_matmul_readvariableop_resource* 
_output_shapes
:
��*
dtype0�
dense_3/MatMulMatMulflatten_1/Reshape:output:0%dense_3/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
dense_3/BiasAdd/ReadVariableOpReadVariableOp'dense_3_biasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0�
dense_3/BiasAddBiasAdddense_3/MatMul:product:0&dense_3/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������a
dense_3/ReluReludense_3/BiasAdd:output:0*
T0*(
_output_shapes
:����������{
"dense_3/ActivityRegularizer/SquareSquaredense_3/Relu:activations:0*
T0*(
_output_shapes
:����������r
!dense_3/ActivityRegularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
dense_3/ActivityRegularizer/SumSum&dense_3/ActivityRegularizer/Square:y:0*dense_3/ActivityRegularizer/Const:output:0*
T0*
_output_shapes
: f
!dense_3/ActivityRegularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_3/ActivityRegularizer/mulMul*dense_3/ActivityRegularizer/mul/x:output:0(dense_3/ActivityRegularizer/Sum:output:0*
T0*
_output_shapes
: k
!dense_3/ActivityRegularizer/ShapeShapedense_3/Relu:activations:0*
T0*
_output_shapes
:y
/dense_3/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: {
1dense_3/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1dense_3/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)dense_3/ActivityRegularizer/strided_sliceStridedSlice*dense_3/ActivityRegularizer/Shape:output:08dense_3/ActivityRegularizer/strided_slice/stack:output:0:dense_3/ActivityRegularizer/strided_slice/stack_1:output:0:dense_3/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
 dense_3/ActivityRegularizer/CastCast2dense_3/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
#dense_3/ActivityRegularizer/truedivRealDiv#dense_3/ActivityRegularizer/mul:z:0$dense_3/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: m
dropout_1/IdentityIdentitydense_3/Relu:activations:0*
T0*(
_output_shapes
:�����������
dense_4/MatMul/ReadVariableOpReadVariableOp&dense_4_matmul_readvariableop_resource*
_output_shapes
:	�2*
dtype0�
dense_4/MatMulMatMuldropout_1/Identity:output:0%dense_4/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2�
dense_4/BiasAdd/ReadVariableOpReadVariableOp'dense_4_biasadd_readvariableop_resource*
_output_shapes
:2*
dtype0�
dense_4/BiasAddBiasAdddense_4/MatMul:product:0&dense_4/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2`
dense_4/ReluReludense_4/BiasAdd:output:0*
T0*'
_output_shapes
:���������2z
"dense_4/ActivityRegularizer/SquareSquaredense_4/Relu:activations:0*
T0*'
_output_shapes
:���������2r
!dense_4/ActivityRegularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
dense_4/ActivityRegularizer/SumSum&dense_4/ActivityRegularizer/Square:y:0*dense_4/ActivityRegularizer/Const:output:0*
T0*
_output_shapes
: f
!dense_4/ActivityRegularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_4/ActivityRegularizer/mulMul*dense_4/ActivityRegularizer/mul/x:output:0(dense_4/ActivityRegularizer/Sum:output:0*
T0*
_output_shapes
: k
!dense_4/ActivityRegularizer/ShapeShapedense_4/Relu:activations:0*
T0*
_output_shapes
:y
/dense_4/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: {
1dense_4/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1dense_4/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)dense_4/ActivityRegularizer/strided_sliceStridedSlice*dense_4/ActivityRegularizer/Shape:output:08dense_4/ActivityRegularizer/strided_slice/stack:output:0:dense_4/ActivityRegularizer/strided_slice/stack_1:output:0:dense_4/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
 dense_4/ActivityRegularizer/CastCast2dense_4/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
#dense_4/ActivityRegularizer/truedivRealDiv#dense_4/ActivityRegularizer/mul:z:0$dense_4/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: �
dense_5/MatMul/ReadVariableOpReadVariableOp&dense_5_matmul_readvariableop_resource*
_output_shapes

:2	*
dtype0�
dense_5/MatMulMatMuldense_4/Relu:activations:0%dense_5/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������	�
dense_5/BiasAdd/ReadVariableOpReadVariableOp'dense_5_biasadd_readvariableop_resource*
_output_shapes
:	*
dtype0�
dense_5/BiasAddBiasAdddense_5/MatMul:product:0&dense_5/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������	x
"dense_5/ActivityRegularizer/SquareSquaredense_5/BiasAdd:output:0*
T0*'
_output_shapes
:���������	r
!dense_5/ActivityRegularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       �
dense_5/ActivityRegularizer/SumSum&dense_5/ActivityRegularizer/Square:y:0*dense_5/ActivityRegularizer/Const:output:0*
T0*
_output_shapes
: f
!dense_5/ActivityRegularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_5/ActivityRegularizer/mulMul*dense_5/ActivityRegularizer/mul/x:output:0(dense_5/ActivityRegularizer/Sum:output:0*
T0*
_output_shapes
: i
!dense_5/ActivityRegularizer/ShapeShapedense_5/BiasAdd:output:0*
T0*
_output_shapes
:y
/dense_5/ActivityRegularizer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: {
1dense_5/ActivityRegularizer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:{
1dense_5/ActivityRegularizer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
)dense_5/ActivityRegularizer/strided_sliceStridedSlice*dense_5/ActivityRegularizer/Shape:output:08dense_5/ActivityRegularizer/strided_slice/stack:output:0:dense_5/ActivityRegularizer/strided_slice/stack_1:output:0:dense_5/ActivityRegularizer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
 dense_5/ActivityRegularizer/CastCast2dense_5/ActivityRegularizer/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: �
#dense_5/ActivityRegularizer/truedivRealDiv#dense_5/ActivityRegularizer/mul:z:0$dense_5/ActivityRegularizer/Cast:y:0*
T0*
_output_shapes
: h
softmax_1/SoftmaxSoftmaxdense_5/BiasAdd:output:0*
T0*'
_output_shapes
:���������	�
1conv1d_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp4conv1d_1_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:	*
dtype0�
"conv1d_1/kernel/Regularizer/SquareSquare9conv1d_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*"
_output_shapes
:	v
!conv1d_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*!
valueB"          �
conv1d_1/kernel/Regularizer/SumSum&conv1d_1/kernel/Regularizer/Square:y:0*conv1d_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: f
!conv1d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
conv1d_1/kernel/Regularizer/mulMul*conv1d_1/kernel/Regularizer/mul/x:output:0(conv1d_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
/conv1d_1/bias/Regularizer/Square/ReadVariableOpReadVariableOp(conv1d_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
 conv1d_1/bias/Regularizer/SquareSquare7conv1d_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:i
conv1d_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
conv1d_1/bias/Regularizer/SumSum$conv1d_1/bias/Regularizer/Square:y:0(conv1d_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: d
conv1d_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
conv1d_1/bias/Regularizer/mulMul(conv1d_1/bias/Regularizer/mul/x:output:0&conv1d_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
.dense_3/bias/Regularizer/Square/ReadVariableOpReadVariableOp'dense_3_biasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0�
dense_3/bias/Regularizer/SquareSquare6dense_3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes	
:�h
dense_3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_3/bias/Regularizer/SumSum#dense_3/bias/Regularizer/Square:y:0'dense_3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_3/bias/Regularizer/mulMul'dense_3/bias/Regularizer/mul/x:output:0%dense_3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
.dense_4/bias/Regularizer/Square/ReadVariableOpReadVariableOp'dense_4_biasadd_readvariableop_resource*
_output_shapes
:2*
dtype0�
dense_4/bias/Regularizer/SquareSquare6dense_4/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2h
dense_4/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_4/bias/Regularizer/SumSum#dense_4/bias/Regularizer/Square:y:0'dense_4/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_4/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_4/bias/Regularizer/mulMul'dense_4/bias/Regularizer/mul/x:output:0%dense_4/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
.dense_5/bias/Regularizer/Square/ReadVariableOpReadVariableOp'dense_5_biasadd_readvariableop_resource*
_output_shapes
:	*
dtype0�
dense_5/bias/Regularizer/SquareSquare6dense_5/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	h
dense_5/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_5/bias/Regularizer/SumSum#dense_5/bias/Regularizer/Square:y:0'dense_5/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_5/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_5/bias/Regularizer/mulMul'dense_5/bias/Regularizer/mul/x:output:0%dense_5/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: j
IdentityIdentitysoftmax_1/Softmax:softmax:0^NoOp*
T0*'
_output_shapes
:���������	h

Identity_1Identity(conv1d_1/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: g

Identity_2Identity'dense_3/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: g

Identity_3Identity'dense_4/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: g

Identity_4Identity'dense_5/ActivityRegularizer/truediv:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp ^conv1d_1/BiasAdd/ReadVariableOp,^conv1d_1/Conv1D/ExpandDims_1/ReadVariableOp0^conv1d_1/bias/Regularizer/Square/ReadVariableOp2^conv1d_1/kernel/Regularizer/Square/ReadVariableOp^dense_3/BiasAdd/ReadVariableOp^dense_3/MatMul/ReadVariableOp/^dense_3/bias/Regularizer/Square/ReadVariableOp^dense_4/BiasAdd/ReadVariableOp^dense_4/MatMul/ReadVariableOp/^dense_4/bias/Regularizer/Square/ReadVariableOp^dense_5/BiasAdd/ReadVariableOp^dense_5/MatMul/ReadVariableOp/^dense_5/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0"!

identity_2Identity_2:output:0"!

identity_3Identity_3:output:0"!

identity_4Identity_4:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������	: : : : : : : : 2B
conv1d_1/BiasAdd/ReadVariableOpconv1d_1/BiasAdd/ReadVariableOp2Z
+conv1d_1/Conv1D/ExpandDims_1/ReadVariableOp+conv1d_1/Conv1D/ExpandDims_1/ReadVariableOp2b
/conv1d_1/bias/Regularizer/Square/ReadVariableOp/conv1d_1/bias/Regularizer/Square/ReadVariableOp2f
1conv1d_1/kernel/Regularizer/Square/ReadVariableOp1conv1d_1/kernel/Regularizer/Square/ReadVariableOp2@
dense_3/BiasAdd/ReadVariableOpdense_3/BiasAdd/ReadVariableOp2>
dense_3/MatMul/ReadVariableOpdense_3/MatMul/ReadVariableOp2`
.dense_3/bias/Regularizer/Square/ReadVariableOp.dense_3/bias/Regularizer/Square/ReadVariableOp2@
dense_4/BiasAdd/ReadVariableOpdense_4/BiasAdd/ReadVariableOp2>
dense_4/MatMul/ReadVariableOpdense_4/MatMul/ReadVariableOp2`
.dense_4/bias/Regularizer/Square/ReadVariableOp.dense_4/bias/Regularizer/Square/ReadVariableOp2@
dense_5/BiasAdd/ReadVariableOpdense_5/BiasAdd/ReadVariableOp2>
dense_5/MatMul/ReadVariableOpdense_5/MatMul/ReadVariableOp2`
.dense_5/bias/Regularizer/Square/ReadVariableOp.dense_5/bias/Regularizer/Square/ReadVariableOp:S O
+
_output_shapes
:���������	
 
_user_specified_nameinputs
�	
�
/__inference_sequential_1_layer_call_fn_17903169

inputs
unknown:	
	unknown_0:
	unknown_1:
��
	unknown_2:	�
	unknown_3:	�2
	unknown_4:2
	unknown_5:2	
	unknown_6:	
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout	
2*
_collective_manager_ids
 */
_output_shapes
:���������	: : : : **
_read_only_resource_inputs

*8
config_proto(&

CPU

GPU2*0J

 �AE8� *S
fNRL
J__inference_sequential_1_layer_call_and_return_conditional_losses_17902796o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������	: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:���������	
 
_user_specified_nameinputs
�
H
1__inference_dense_3_activity_regularizer_17902306
x
identity6
SquareSquarex*
T0*
_output_shapes
:9
RankRank
Square:y:0*
T0*
_output_shapes
: M
range/startConst*
_output_shapes
: *
dtype0*
value	B : M
range/deltaConst*
_output_shapes
: *
dtype0*
value	B :n
rangeRangerange/start:output:0Rank:output:0range/delta:output:0*#
_output_shapes
:���������G
SumSum
Square:y:0range:output:0*
T0*
_output_shapes
: J
mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    I
mulMulmul/x:output:0Sum:output:0*
T0*
_output_shapes
: >
IdentityIdentitymul:z:0*
T0*
_output_shapes
: "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
::; 7

_output_shapes
:

_user_specified_namex
�
�
I__inference_dense_5_layer_call_and_return_all_conditional_losses_17903600

inputs
unknown:2	
	unknown_0:	
identity

identity_1��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������	*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *N
fIRG
E__inference_dense_5_layer_call_and_return_conditional_losses_17902474�
PartitionedCallPartitionedCall StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *:
f5R3
1__inference_dense_5_activity_regularizer_17902332o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������	X

Identity_1IdentityPartitionedCall:output:0^NoOp*
T0*
_output_shapes
: `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������2: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������2
 
_user_specified_nameinputs
�
�
__inference_loss_fn_0_17903637P
:conv1d_1_kernel_regularizer_square_readvariableop_resource:	
identity��1conv1d_1/kernel/Regularizer/Square/ReadVariableOp�
1conv1d_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp:conv1d_1_kernel_regularizer_square_readvariableop_resource*"
_output_shapes
:	*
dtype0�
"conv1d_1/kernel/Regularizer/SquareSquare9conv1d_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*"
_output_shapes
:	v
!conv1d_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*!
valueB"          �
conv1d_1/kernel/Regularizer/SumSum&conv1d_1/kernel/Regularizer/Square:y:0*conv1d_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: f
!conv1d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
conv1d_1/kernel/Regularizer/mulMul*conv1d_1/kernel/Regularizer/mul/x:output:0(conv1d_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: a
IdentityIdentity#conv1d_1/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: z
NoOpNoOp2^conv1d_1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2f
1conv1d_1/kernel/Regularizer/Square/ReadVariableOp1conv1d_1/kernel/Regularizer/Square/ReadVariableOp
�
�
E__inference_dense_4_layer_call_and_return_conditional_losses_17902444

inputs1
matmul_readvariableop_resource:	�2-
biasadd_readvariableop_resource:2
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�.dense_4/bias/Regularizer/Square/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�2*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:2*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������2�
.dense_4/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:2*
dtype0�
dense_4/bias/Regularizer/SquareSquare6dense_4/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2h
dense_4/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
dense_4/bias/Regularizer/SumSum#dense_4/bias/Regularizer/Square:y:0'dense_4/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: c
dense_4/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
dense_4/bias/Regularizer/mulMul'dense_4/bias/Regularizer/mul/x:output:0%dense_4/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������2�
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp/^dense_4/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2`
.dense_4/bias/Regularizer/Square/ReadVariableOp.dense_4/bias/Regularizer/Square/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
J__inference_conv1d_1_layer_call_and_return_all_conditional_losses_17903440

inputs
unknown:	
	unknown_0:
identity

identity_1��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *O
fJRH
F__inference_conv1d_1_layer_call_and_return_conditional_losses_17902367�
PartitionedCallPartitionedCall StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *;
f6R4
2__inference_conv1d_1_activity_regularizer_17902293s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:���������X

Identity_1IdentityPartitionedCall:output:0^NoOp*
T0*
_output_shapes
: `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	: : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:���������	
 
_user_specified_nameinputs
� 
�
F__inference_conv1d_1_layer_call_and_return_conditional_losses_17902367

inputsA
+conv1d_expanddims_1_readvariableop_resource:	-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�"Conv1D/ExpandDims_1/ReadVariableOp�/conv1d_1/bias/Regularizer/Square/ReadVariableOp�1conv1d_1/kernel/Regularizer/Square/ReadVariableOp`
Conv1D/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
Conv1D/ExpandDims
ExpandDimsinputsConv1D/ExpandDims/dim:output:0*
T0*/
_output_shapes
:���������	�
"Conv1D/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:	*
dtype0Y
Conv1D/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : �
Conv1D/ExpandDims_1
ExpandDims*Conv1D/ExpandDims_1/ReadVariableOp:value:0 Conv1D/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:	�
Conv1DConv2DConv1D/ExpandDims:output:0Conv1D/ExpandDims_1:output:0*
T0*/
_output_shapes
:���������*
paddingVALID*
strides
�
Conv1D/SqueezeSqueezeConv1D:output:0*
T0*+
_output_shapes
:���������*
squeeze_dims

���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
BiasAddBiasAddConv1D/Squeeze:output:0BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:���������R
EluEluBiasAdd:output:0*
T0*+
_output_shapes
:����������
1conv1d_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:	*
dtype0�
"conv1d_1/kernel/Regularizer/SquareSquare9conv1d_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*"
_output_shapes
:	v
!conv1d_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*!
valueB"          �
conv1d_1/kernel/Regularizer/SumSum&conv1d_1/kernel/Regularizer/Square:y:0*conv1d_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: f
!conv1d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
conv1d_1/kernel/Regularizer/mulMul*conv1d_1/kernel/Regularizer/mul/x:output:0(conv1d_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
/conv1d_1/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
 conv1d_1/bias/Regularizer/SquareSquare7conv1d_1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:i
conv1d_1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: �
conv1d_1/bias/Regularizer/SumSum$conv1d_1/bias/Regularizer/Square:y:0(conv1d_1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: d
conv1d_1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    �
conv1d_1/bias/Regularizer/mulMul(conv1d_1/bias/Regularizer/mul/x:output:0&conv1d_1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: d
IdentityIdentityElu:activations:0^NoOp*
T0*+
_output_shapes
:����������
NoOpNoOp^BiasAdd/ReadVariableOp#^Conv1D/ExpandDims_1/ReadVariableOp0^conv1d_1/bias/Regularizer/Square/ReadVariableOp2^conv1d_1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"Conv1D/ExpandDims_1/ReadVariableOp"Conv1D/ExpandDims_1/ReadVariableOp2b
/conv1d_1/bias/Regularizer/Square/ReadVariableOp/conv1d_1/bias/Regularizer/Square/ReadVariableOp2f
1conv1d_1/kernel/Regularizer/Square/ReadVariableOp1conv1d_1/kernel/Regularizer/Square/ReadVariableOp:S O
+
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
*__inference_dense_4_layer_call_fn_17903552

inputs
unknown:	�2
	unknown_0:2
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *N
fIRG
E__inference_dense_4_layer_call_and_return_conditional_losses_17902444o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
c
G__inference_softmax_1_layer_call_and_return_conditional_losses_17903626

inputs
identityL
SoftmaxSoftmaxinputs*
T0*'
_output_shapes
:���������	Y
IdentityIdentitySoftmax:softmax:0*
T0*'
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������	:O K
'
_output_shapes
:���������	
 
_user_specified_nameinputs
�

�
/__inference_sequential_1_layer_call_fn_17902844
conv1d_1_input
unknown:	
	unknown_0:
	unknown_1:
��
	unknown_2:	�
	unknown_3:	�2
	unknown_4:2
	unknown_5:2	
	unknown_6:	
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallconv1d_1_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout	
2*
_collective_manager_ids
 */
_output_shapes
:���������	: : : : **
_read_only_resource_inputs

*8
config_proto(&

CPU

GPU2*0J

 �AE8� *S
fNRL
J__inference_sequential_1_layer_call_and_return_conditional_losses_17902796o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������	: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
+
_output_shapes
:���������	
(
_user_specified_nameconv1d_1_input
�
�
I__inference_dense_3_layer_call_and_return_all_conditional_losses_17903499

inputs
unknown:
��
	unknown_0:	�
identity

identity_1��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

 �AE8� *N
fIRG
E__inference_dense_3_layer_call_and_return_conditional_losses_17902406�
PartitionedCallPartitionedCall StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

 �AE8� *:
f5R3
1__inference_dense_3_activity_regularizer_17902306p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:����������X

Identity_1IdentityPartitionedCall:output:0^NoOp*
T0*
_output_shapes
: `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�	
�
&__inference_signature_wrapper_17903089
conv1d_1_input
unknown:	
	unknown_0:
	unknown_1:
��
	unknown_2:	�
	unknown_3:	�2
	unknown_4:2
	unknown_5:2	
	unknown_6:	
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallconv1d_1_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6*
Tin
2	*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������	**
_read_only_resource_inputs

*8
config_proto(&

CPU

GPU2*0J

 �AE8� *,
f'R%
#__inference__wrapped_model_17902280o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������	: : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
+
_output_shapes
:���������	
(
_user_specified_nameconv1d_1_input"�L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*�
serving_default�
M
conv1d_1_input;
 serving_default_conv1d_1_input:0���������	=
	softmax_10
StatefulPartitionedCall:0���������	tensorflow/serving/predict:��
�
layer_with_weights-0
layer-0
layer-1
layer_with_weights-1
layer-2
layer-3
layer_with_weights-2
layer-4
layer_with_weights-3
layer-5
layer-6
	variables
	trainable_variables

regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures"
_tf_keras_sequential
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses

kernel
bias
 _jit_compiled_convolution_op"
_tf_keras_layer
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses"
_tf_keras_layer
�
 	variables
!trainable_variables
"regularization_losses
#	keras_api
$__call__
*%&call_and_return_all_conditional_losses

&kernel
'bias"
_tf_keras_layer
�
(	variables
)trainable_variables
*regularization_losses
+	keras_api
,__call__
*-&call_and_return_all_conditional_losses
._random_generator"
_tf_keras_layer
�
/	variables
0trainable_variables
1regularization_losses
2	keras_api
3__call__
*4&call_and_return_all_conditional_losses

5kernel
6bias"
_tf_keras_layer
�
7	variables
8trainable_variables
9regularization_losses
:	keras_api
;__call__
*<&call_and_return_all_conditional_losses

=kernel
>bias"
_tf_keras_layer
�
?	variables
@trainable_variables
Aregularization_losses
B	keras_api
C__call__
*D&call_and_return_all_conditional_losses"
_tf_keras_layer
X
0
1
&2
'3
54
65
=6
>7"
trackable_list_wrapper
X
0
1
&2
'3
54
65
=6
>7"
trackable_list_wrapper
C
E0
F1
G2
H3
I4"
trackable_list_wrapper
�
Jnon_trainable_variables

Klayers
Lmetrics
Mlayer_regularization_losses
Nlayer_metrics
	variables
	trainable_variables

regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
�
Otrace_0
Ptrace_1
Qtrace_2
Rtrace_32�
/__inference_sequential_1_layer_call_fn_17902553
/__inference_sequential_1_layer_call_fn_17903144
/__inference_sequential_1_layer_call_fn_17903169
/__inference_sequential_1_layer_call_fn_17902844�
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
 zOtrace_0zPtrace_1zQtrace_2zRtrace_3
�
Strace_0
Ttrace_1
Utrace_2
Vtrace_32�
J__inference_sequential_1_layer_call_and_return_conditional_losses_17903291
J__inference_sequential_1_layer_call_and_return_conditional_losses_17903420
J__inference_sequential_1_layer_call_and_return_conditional_losses_17902937
J__inference_sequential_1_layer_call_and_return_conditional_losses_17903030�
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
 zStrace_0zTtrace_1zUtrace_2zVtrace_3
�B�
#__inference__wrapped_model_17902280conv1d_1_input"�
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
�
Witer

Xbeta_1

Ybeta_2
	Zdecay
[learning_ratem�m�&m�'m�5m�6m�=m�>m�v�v�&v�'v�5v�6v�=v�>v�"
	optimizer
,
\serving_default"
signature_map
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
.
E0
F1"
trackable_list_wrapper
�
]non_trainable_variables

^layers
_metrics
`layer_regularization_losses
alayer_metrics
	variables
trainable_variables
regularization_losses
__call__
bactivity_regularizer_fn
*&call_and_return_all_conditional_losses
&c"call_and_return_conditional_losses"
_generic_user_object
�
dtrace_02�
+__inference_conv1d_1_layer_call_fn_17903429�
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
 zdtrace_0
�
etrace_02�
J__inference_conv1d_1_layer_call_and_return_all_conditional_losses_17903440�
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
 zetrace_0
%:#	2conv1d_1/kernel
:2conv1d_1/bias
�2��
���
FullArgSpec'
args�
jself
jinputs
jkernel
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
 0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
fnon_trainable_variables

glayers
hmetrics
ilayer_regularization_losses
jlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
�
ktrace_02�
,__inference_flatten_1_layer_call_fn_17903473�
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
 zktrace_0
�
ltrace_02�
G__inference_flatten_1_layer_call_and_return_conditional_losses_17903479�
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
 zltrace_0
.
&0
'1"
trackable_list_wrapper
.
&0
'1"
trackable_list_wrapper
'
G0"
trackable_list_wrapper
�
mnon_trainable_variables

nlayers
ometrics
player_regularization_losses
qlayer_metrics
 	variables
!trainable_variables
"regularization_losses
$__call__
ractivity_regularizer_fn
*%&call_and_return_all_conditional_losses
&s"call_and_return_conditional_losses"
_generic_user_object
�
ttrace_02�
*__inference_dense_3_layer_call_fn_17903488�
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
 zttrace_0
�
utrace_02�
I__inference_dense_3_layer_call_and_return_all_conditional_losses_17903499�
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
 zutrace_0
": 
��2dense_3/kernel
:�2dense_3/bias
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
vnon_trainable_variables

wlayers
xmetrics
ylayer_regularization_losses
zlayer_metrics
(	variables
)trainable_variables
*regularization_losses
,__call__
*-&call_and_return_all_conditional_losses
&-"call_and_return_conditional_losses"
_generic_user_object
�
{trace_0
|trace_12�
,__inference_dropout_1_layer_call_fn_17903521
,__inference_dropout_1_layer_call_fn_17903526�
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
 z{trace_0z|trace_1
�
}trace_0
~trace_12�
G__inference_dropout_1_layer_call_and_return_conditional_losses_17903531
G__inference_dropout_1_layer_call_and_return_conditional_losses_17903543�
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
 z}trace_0z~trace_1
"
_generic_user_object
.
50
61"
trackable_list_wrapper
.
50
61"
trackable_list_wrapper
'
H0"
trackable_list_wrapper
�
non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
/	variables
0trainable_variables
1regularization_losses
3__call__
�activity_regularizer_fn
*4&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
*__inference_dense_4_layer_call_fn_17903552�
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
 z�trace_0
�
�trace_02�
I__inference_dense_4_layer_call_and_return_all_conditional_losses_17903563�
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
 z�trace_0
!:	�22dense_4/kernel
:22dense_4/bias
.
=0
>1"
trackable_list_wrapper
.
=0
>1"
trackable_list_wrapper
'
I0"
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
7	variables
8trainable_variables
9regularization_losses
;__call__
�activity_regularizer_fn
*<&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
*__inference_dense_5_layer_call_fn_17903589�
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
 z�trace_0
�
�trace_02�
I__inference_dense_5_layer_call_and_return_all_conditional_losses_17903600�
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
 z�trace_0
 :2	2dense_5/kernel
:	2dense_5/bias
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
?	variables
@trainable_variables
Aregularization_losses
C__call__
*D&call_and_return_all_conditional_losses
&D"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
,__inference_softmax_1_layer_call_fn_17903621�
���
FullArgSpec%
args�
jself
jinputs
jmask
varargs
 
varkw
 
defaults�

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
G__inference_softmax_1_layer_call_and_return_conditional_losses_17903626�
���
FullArgSpec%
args�
jself
jinputs
jmask
varargs
 
varkw
 
defaults�

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
__inference_loss_fn_0_17903637�
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
annotations� *� z�trace_0
�
�trace_02�
__inference_loss_fn_1_17903648�
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
annotations� *� z�trace_0
�
�trace_02�
__inference_loss_fn_2_17903659�
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
annotations� *� z�trace_0
�
�trace_02�
__inference_loss_fn_3_17903670�
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
annotations� *� z�trace_0
�
�trace_02�
__inference_loss_fn_4_17903681�
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
annotations� *� z�trace_0
 "
trackable_list_wrapper
Q
0
1
2
3
4
5
6"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
/__inference_sequential_1_layer_call_fn_17902553conv1d_1_input"�
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
�B�
/__inference_sequential_1_layer_call_fn_17903144inputs"�
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
�B�
/__inference_sequential_1_layer_call_fn_17903169inputs"�
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
�B�
/__inference_sequential_1_layer_call_fn_17902844conv1d_1_input"�
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
�B�
J__inference_sequential_1_layer_call_and_return_conditional_losses_17903291inputs"�
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
�B�
J__inference_sequential_1_layer_call_and_return_conditional_losses_17903420inputs"�
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
�B�
J__inference_sequential_1_layer_call_and_return_conditional_losses_17902937conv1d_1_input"�
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
�B�
J__inference_sequential_1_layer_call_and_return_conditional_losses_17903030conv1d_1_input"�
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
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
�B�
&__inference_signature_wrapper_17903089conv1d_1_input"�
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
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
.
E0
F1"
trackable_list_wrapper
 "
trackable_dict_wrapper
�
�trace_02�
2__inference_conv1d_1_activity_regularizer_17902293�
���
FullArgSpec
args�
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *�
	�z�trace_0
�
�trace_02�
F__inference_conv1d_1_layer_call_and_return_conditional_losses_17903468�
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
 z�trace_0
�B�
+__inference_conv1d_1_layer_call_fn_17903429inputs"�
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
�B�
J__inference_conv1d_1_layer_call_and_return_all_conditional_losses_17903440inputs"�
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
�B�
,__inference_flatten_1_layer_call_fn_17903473inputs"�
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
�B�
G__inference_flatten_1_layer_call_and_return_conditional_losses_17903479inputs"�
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
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
'
G0"
trackable_list_wrapper
 "
trackable_dict_wrapper
�
�trace_02�
1__inference_dense_3_activity_regularizer_17902306�
���
FullArgSpec
args�
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *�
	�z�trace_0
�
�trace_02�
E__inference_dense_3_layer_call_and_return_conditional_losses_17903516�
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
 z�trace_0
�B�
*__inference_dense_3_layer_call_fn_17903488inputs"�
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
�B�
I__inference_dense_3_layer_call_and_return_all_conditional_losses_17903499inputs"�
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
�B�
,__inference_dropout_1_layer_call_fn_17903521inputs"�
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
�B�
,__inference_dropout_1_layer_call_fn_17903526inputs"�
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
�B�
G__inference_dropout_1_layer_call_and_return_conditional_losses_17903531inputs"�
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
�B�
G__inference_dropout_1_layer_call_and_return_conditional_losses_17903543inputs"�
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
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
'
H0"
trackable_list_wrapper
 "
trackable_dict_wrapper
�
�trace_02�
1__inference_dense_4_activity_regularizer_17902319�
���
FullArgSpec
args�
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *�
	�z�trace_0
�
�trace_02�
E__inference_dense_4_layer_call_and_return_conditional_losses_17903580�
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
 z�trace_0
�B�
*__inference_dense_4_layer_call_fn_17903552inputs"�
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
�B�
I__inference_dense_4_layer_call_and_return_all_conditional_losses_17903563inputs"�
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
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
'
I0"
trackable_list_wrapper
 "
trackable_dict_wrapper
�
�trace_02�
1__inference_dense_5_activity_regularizer_17902332�
���
FullArgSpec
args�
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *�
	�z�trace_0
�
�trace_02�
E__inference_dense_5_layer_call_and_return_conditional_losses_17903616�
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
 z�trace_0
�B�
*__inference_dense_5_layer_call_fn_17903589inputs"�
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
�B�
I__inference_dense_5_layer_call_and_return_all_conditional_losses_17903600inputs"�
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
�B�
,__inference_softmax_1_layer_call_fn_17903621inputs"�
���
FullArgSpec%
args�
jself
jinputs
jmask
varargs
 
varkw
 
defaults�

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
G__inference_softmax_1_layer_call_and_return_conditional_losses_17903626inputs"�
���
FullArgSpec%
args�
jself
jinputs
jmask
varargs
 
varkw
 
defaults�

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
__inference_loss_fn_0_17903637"�
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
__inference_loss_fn_1_17903648"�
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
__inference_loss_fn_2_17903659"�
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
__inference_loss_fn_3_17903670"�
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
__inference_loss_fn_4_17903681"�
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
R
�	variables
�	keras_api

�total

�count"
_tf_keras_metric
c
�	variables
�	keras_api

�total

�count
�
_fn_kwargs"
_tf_keras_metric
�B�
2__inference_conv1d_1_activity_regularizer_17902293x"�
���
FullArgSpec
args�
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *�
	�
�B�
F__inference_conv1d_1_layer_call_and_return_conditional_losses_17903468inputs"�
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
�B�
1__inference_dense_3_activity_regularizer_17902306x"�
���
FullArgSpec
args�
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *�
	�
�B�
E__inference_dense_3_layer_call_and_return_conditional_losses_17903516inputs"�
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
�B�
1__inference_dense_4_activity_regularizer_17902319x"�
���
FullArgSpec
args�
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *�
	�
�B�
E__inference_dense_4_layer_call_and_return_conditional_losses_17903580inputs"�
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
�B�
1__inference_dense_5_activity_regularizer_17902332x"�
���
FullArgSpec
args�
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *�
	�
�B�
E__inference_dense_5_layer_call_and_return_conditional_losses_17903616inputs"�
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
0
�0
�1"
trackable_list_wrapper
.
�	variables"
_generic_user_object
:  (2total
:  (2count
0
�0
�1"
trackable_list_wrapper
.
�	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper
*:(	2Adam/conv1d_1/kernel/m
 :2Adam/conv1d_1/bias/m
':%
��2Adam/dense_3/kernel/m
 :�2Adam/dense_3/bias/m
&:$	�22Adam/dense_4/kernel/m
:22Adam/dense_4/bias/m
%:#2	2Adam/dense_5/kernel/m
:	2Adam/dense_5/bias/m
*:(	2Adam/conv1d_1/kernel/v
 :2Adam/conv1d_1/bias/v
':%
��2Adam/dense_3/kernel/v
 :�2Adam/dense_3/bias/v
&:$	�22Adam/dense_4/kernel/v
:22Adam/dense_4/bias/v
%:#2	2Adam/dense_5/kernel/v
:	2Adam/dense_5/bias/v�
#__inference__wrapped_model_17902280~&'56=>;�8
1�.
,�)
conv1d_1_input���������	
� "5�2
0
	softmax_1#� 
	softmax_1���������	\
2__inference_conv1d_1_activity_regularizer_17902293&�
�
�	
x
� "� �
J__inference_conv1d_1_layer_call_and_return_all_conditional_losses_17903440r3�0
)�&
$�!
inputs���������	
� "7�4
�
0���������
�
�	
1/0 �
F__inference_conv1d_1_layer_call_and_return_conditional_losses_17903468d3�0
)�&
$�!
inputs���������	
� ")�&
�
0���������
� �
+__inference_conv1d_1_layer_call_fn_17903429W3�0
)�&
$�!
inputs���������	
� "����������[
1__inference_dense_3_activity_regularizer_17902306&�
�
�	
x
� "� �
I__inference_dense_3_layer_call_and_return_all_conditional_losses_17903499l&'0�-
&�#
!�
inputs����������
� "4�1
�
0����������
�
�	
1/0 �
E__inference_dense_3_layer_call_and_return_conditional_losses_17903516^&'0�-
&�#
!�
inputs����������
� "&�#
�
0����������
� 
*__inference_dense_3_layer_call_fn_17903488Q&'0�-
&�#
!�
inputs����������
� "�����������[
1__inference_dense_4_activity_regularizer_17902319&�
�
�	
x
� "� �
I__inference_dense_4_layer_call_and_return_all_conditional_losses_17903563k560�-
&�#
!�
inputs����������
� "3�0
�
0���������2
�
�	
1/0 �
E__inference_dense_4_layer_call_and_return_conditional_losses_17903580]560�-
&�#
!�
inputs����������
� "%�"
�
0���������2
� ~
*__inference_dense_4_layer_call_fn_17903552P560�-
&�#
!�
inputs����������
� "����������2[
1__inference_dense_5_activity_regularizer_17902332&�
�
�	
x
� "� �
I__inference_dense_5_layer_call_and_return_all_conditional_losses_17903600j=>/�,
%�"
 �
inputs���������2
� "3�0
�
0���������	
�
�	
1/0 �
E__inference_dense_5_layer_call_and_return_conditional_losses_17903616\=>/�,
%�"
 �
inputs���������2
� "%�"
�
0���������	
� }
*__inference_dense_5_layer_call_fn_17903589O=>/�,
%�"
 �
inputs���������2
� "����������	�
G__inference_dropout_1_layer_call_and_return_conditional_losses_17903531^4�1
*�'
!�
inputs����������
p 
� "&�#
�
0����������
� �
G__inference_dropout_1_layer_call_and_return_conditional_losses_17903543^4�1
*�'
!�
inputs����������
p
� "&�#
�
0����������
� �
,__inference_dropout_1_layer_call_fn_17903521Q4�1
*�'
!�
inputs����������
p 
� "������������
,__inference_dropout_1_layer_call_fn_17903526Q4�1
*�'
!�
inputs����������
p
� "������������
G__inference_flatten_1_layer_call_and_return_conditional_losses_17903479]3�0
)�&
$�!
inputs���������
� "&�#
�
0����������
� �
,__inference_flatten_1_layer_call_fn_17903473P3�0
)�&
$�!
inputs���������
� "�����������=
__inference_loss_fn_0_17903637�

� 
� "� =
__inference_loss_fn_1_17903648�

� 
� "� =
__inference_loss_fn_2_17903659'�

� 
� "� =
__inference_loss_fn_3_179036706�

� 
� "� =
__inference_loss_fn_4_17903681>�

� 
� "� �
J__inference_sequential_1_layer_call_and_return_conditional_losses_17902937�&'56=>C�@
9�6
,�)
conv1d_1_input���������	
p 

 
� "]�Z
�
0���������	
;�8
�	
1/0 
�	
1/1 
�	
1/2 
�	
1/3 �
J__inference_sequential_1_layer_call_and_return_conditional_losses_17903030�&'56=>C�@
9�6
,�)
conv1d_1_input���������	
p

 
� "]�Z
�
0���������	
;�8
�	
1/0 
�	
1/1 
�	
1/2 
�	
1/3 �
J__inference_sequential_1_layer_call_and_return_conditional_losses_17903291�&'56=>;�8
1�.
$�!
inputs���������	
p 

 
� "]�Z
�
0���������	
;�8
�	
1/0 
�	
1/1 
�	
1/2 
�	
1/3 �
J__inference_sequential_1_layer_call_and_return_conditional_losses_17903420�&'56=>;�8
1�.
$�!
inputs���������	
p

 
� "]�Z
�
0���������	
;�8
�	
1/0 
�	
1/1 
�	
1/2 
�	
1/3 �
/__inference_sequential_1_layer_call_fn_17902553i&'56=>C�@
9�6
,�)
conv1d_1_input���������	
p 

 
� "����������	�
/__inference_sequential_1_layer_call_fn_17902844i&'56=>C�@
9�6
,�)
conv1d_1_input���������	
p

 
� "����������	�
/__inference_sequential_1_layer_call_fn_17903144a&'56=>;�8
1�.
$�!
inputs���������	
p 

 
� "����������	�
/__inference_sequential_1_layer_call_fn_17903169a&'56=>;�8
1�.
$�!
inputs���������	
p

 
� "����������	�
&__inference_signature_wrapper_17903089�&'56=>M�J
� 
C�@
>
conv1d_1_input,�)
conv1d_1_input���������	"5�2
0
	softmax_1#� 
	softmax_1���������	�
G__inference_softmax_1_layer_call_and_return_conditional_losses_17903626\3�0
)�&
 �
inputs���������	

 
� "%�"
�
0���������	
� 
,__inference_softmax_1_layer_call_fn_17903621O3�0
)�&
 �
inputs���������	

 
� "����������	