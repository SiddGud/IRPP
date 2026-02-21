#!/bin/bash
# run_rviz.sh — Launch RViz for visualization
# Usage: ./run_rviz.sh  (works from any directory)

cd "$(dirname "$0")"

CONTAINER_NAME="object_fetcher_container"

if ! docker ps -q --filter "name=$CONTAINER_NAME" &> /dev/null; then
    echo "❌ Error: Container '$CONTAINER_NAME' is not running. Run ./quick_start.sh first."
    exit 1
fi

echo "🚀 Launching RViz in container $CONTAINER_NAME..."

docker exec -it $CONTAINER_NAME bash -c "
    source /opt/ros/humble/setup.bash && \
    source install/setup.bash && \
    rviz2 -d install/object_fetcher/share/object_fetcher/config/nav2_view.rviz
"
