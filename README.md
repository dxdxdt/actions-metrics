# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-02-13T13:57:27.901973+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.001 |  |
| ap-east-1 | 0.666 |  |
| ap-northeast-1 | 0.488 |  |
| ap-northeast-2 | 0.594 |  |
| ap-south-1 | 0.915 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.746 |  |
| ap-southeast-2 | 0.652 |  |
| ap-southeast-3 | 0.804 |  |
| ap-southeast-4 | 0.695 |  |
| ca-central-1 | 0.246 | 16 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.518 |  |
| eu-central-2 | 0.556 |  |
| eu-north-1 | 0.582 |  |
| eu-south-1 | 0.544 |  |
| eu-south-2 | 0.559 |  |
| eu-west-1 | 0.442 |  |
| eu-west-2 | 0.491 |  |
| eu-west-3 | 0.503 |  |
| il-central-1 | 0.711 |  |
| me-central-1 | 0.903 |  |
| me-south-1 | 0.869 |  |
| sa-east-1 | 0.623 |  |
| us-east-1 | 0.200 | 4116 |
| us-east-2 | 0.181 | 1336 |
| us-gov-east-1 | 0.184 | 1456 |
| us-gov-west-1 | 0.171 | 146 |
| us-west-1 | 0.130 | 3054 |
| us-west-2 | 0.172 | 125 |

