# Memory comparison rule

This rule is locked before any memory sample exists. The tolerance number is not a measurement. The plan stated no numeric memory-pair tolerance, so this file locks the pre-sample choice. Do not widen this number after results.

Resident memory is the OS field RSS, in kibibytes, from the named monitor.

The named monitor is the first program that `command -v` finds, in this order: `ps -o rss`, then `pidstat -r`, then `smem`. The sample log records which one ran. The field is always RSS in kibibytes. Do not treat a scheduler log as the independent monitor.

Conversion to bytes is resident bytes = RSS kibibytes multiplied by 1024. Do not mix GB and GiB in the arithmetic. Do not convert the launch ceiling through GiB.

Pair each scheduler sample with the monitor sample whose timestamp is nearest, and keep the pair only when the absolute timestamp difference is at most 1 second. If two monitor samples are equally near, use the earlier timestamp. Unpaired samples are listed and are not inside tolerance.

The tolerance is one number. The scheduler sample and the OS monitor sample are not the same instant, and that clock skew is why a tolerance exists. This number is locked before any sample and must not be widened after results. There is no second tolerance. A pair is inside tolerance only when the absolute difference of the two resident-byte readings is at most this number, in the unit below, of the larger of those two readings.

The machine-readable lock block is the next two lines.

ToleranceNumber: 1
ToleranceUnit: percent of the larger of the two resident-byte readings

The launch ceiling is the integer 192000000000. That integer is 192 times 10 to the ninth bytes, the goal's 192 GB launch gate. The integer 206158430208 is the project MemoryMax and is not the launch gate.

While the scheduler reading and the monitor reading disagree, launches use the larger reading.

A slot may be below 32 only while the ceiling is holding, and the log must say so.

The run uses at most 32 concurrent workers. It never starts a 33rd worker.
