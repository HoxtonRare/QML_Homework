function printFigure(ctx, xStep, yStep, index) {
    switch(index){

    case(0):
        ctx.beginPath();
        ctx.moveTo(2 * xStep, yStep);
        ctx.lineTo(2.3 * xStep, 2 * yStep);
        ctx.lineTo(3 * xStep, 2 * yStep);
        ctx.lineTo(2.3 * xStep, 2.3 * yStep);
        ctx.lineTo(2.5 * xStep, 3 * yStep);
        ctx.lineTo(2 * xStep, 2.5 * yStep);
        ctx.lineTo(1.5 * xStep, 3 * yStep);
        ctx.lineTo(1.7 * xStep, 2.3 * yStep);
        ctx.lineTo(0.9 * xStep, 2 * yStep);
        ctx.lineTo(1.7 * xStep, 2 * yStep);
        ctx.closePath();
        break;

    case(1):
        ctx.beginPath();
        ctx.arc(2 * xStep,2 * yStep, xStep, 0, 2*Math.PI, false);
        ctx.closePath();
        break;

    case(2):
        ctx.beginPath();
        ctx.moveTo(2 * xStep, yStep);
        ctx.lineTo(3 * xStep, 2 * yStep);
        ctx.lineTo(xStep, 2 * yStep);
        ctx.lineTo(2 * xStep, yStep);
        ctx.moveTo(3 * xStep, 2 * yStep);
        ctx.lineTo(3 * xStep, 4 * yStep);
        ctx.moveTo(3 * xStep, 4 * yStep);
        ctx.lineTo(xStep, 4 * yStep);
        ctx.moveTo(xStep, 4 * yStep);
        ctx.lineTo(xStep, 2 * yStep);
        break;

    case(3):
        ctx.beginPath();
        ctx.moveTo(4 * xStep, yStep);
        ctx.lineTo(xStep, 4 * yStep);
        ctx.lineTo(4 * xStep, 4 * yStep);
        ctx.lineTo(xStep, yStep);
        ctx.lineTo(4 * xStep, yStep);
    }
}
