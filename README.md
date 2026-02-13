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
Updated: 2026-02-13T10:32:58.437382+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.019 |  |
| ap-east-1 | 0.670 |  |
| ap-northeast-1 | 0.490 |  |
| ap-northeast-2 | 0.601 |  |
| ap-south-1 | 0.907 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.750 |  |
| ap-southeast-2 | 0.648 |  |
| ap-southeast-3 | 0.807 |  |
| ap-southeast-4 | 0.689 |  |
| ca-central-1 | 0.264 | 16 |
| ca-west-1 | 0.225 |  |
| eu-central-1 | 0.549 |  |
| eu-central-2 | 0.539 |  |
| eu-north-1 | 0.596 |  |
| eu-south-1 | 0.573 |  |
| eu-south-2 | 0.568 |  |
| eu-west-1 | 0.444 |  |
| eu-west-2 | 0.489 |  |
| eu-west-3 | 0.528 |  |
| il-central-1 | 0.703 |  |
| me-central-1 | 0.913 |  |
| me-south-1 | 0.878 |  |
| sa-east-1 | 0.637 |  |
| us-east-1 | 0.197 | 4115 |
| us-east-2 | 0.200 | 1336 |
| us-gov-east-1 | 0.198 | 1456 |
| us-gov-west-1 | 0.180 | 145 |
| us-west-1 | 0.123 | 3053 |
| us-west-2 | 0.182 | 125 |

