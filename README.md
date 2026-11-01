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
Updated: 2026-11-01T23:26:10.136439+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.746 |  |
| ap-east-1 | 0.520 |  |
| ap-east-2 | 0.479 |  |
| ap-northeast-1 | 0.388 |  |
| ap-northeast-2 | 0.467 |  |
| ap-northeast-3 | 0.407 |  |
| ap-south-1 | 0.678 |  |
| ap-south-2 | 0.718 |  |
| ap-southeast-1 | 0.577 |  |
| ap-southeast-2 | 0.514 |  |
| ap-southeast-3 | 0.621 |  |
| ap-southeast-4 | 0.573 |  |
| ap-southeast-5 | 0.594 |  |
| ap-southeast-6 | 0.529 |  |
| ap-southeast-7 | 0.658 |  |
| ca-central-1 | 0.135 | 18 |
| ca-west-1 | 0.154 |  |
| eu-central-1 | 0.381 |  |
| eu-central-2 | 0.398 |  |
| eu-north-1 | 0.415 |  |
| eu-south-1 | 0.387 |  |
| eu-south-2 | 0.387 |  |
| eu-west-1 | 0.316 |  |
| eu-west-2 | 0.336 |  |
| eu-west-3 | 0.360 |  |
| il-central-1 | 0.494 |  |
| me-central-1 | 0.647 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.155 |  |
| sa-east-1 | 0.485 |  |
| us-east-1 | 0.130 | 5168 |
| us-east-2 | 0.099 | 1720 |
| us-gov-east-1 | 0.112 | 1958 |
| us-gov-west-1 | 0.139 | 242 |
| us-west-1 | 0.116 | 4203 |
| us-west-2 | 0.138 | 195 |

