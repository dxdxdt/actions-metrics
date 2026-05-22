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
Updated: 2026-05-22T18:30:22.746865+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.885 |  |
| ap-east-1 | 0.800 |  |
| ap-east-2 | 0.736 |  |
| ap-northeast-1 | 0.622 |  |
| ap-northeast-2 | 0.717 |  |
| ap-northeast-3 | 0.639 |  |
| ap-south-1 | 0.828 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.879 |  |
| ap-southeast-2 | 0.780 |  |
| ap-southeast-3 | 0.927 |  |
| ap-southeast-4 | 0.841 |  |
| ap-southeast-5 | 0.895 |  |
| ap-southeast-6 | 0.829 |  |
| ap-southeast-7 | 0.989 |  |
| ca-central-1 | 0.105 | 16 |
| ca-west-1 | 0.225 |  |
| eu-central-1 | 0.398 |  |
| eu-central-2 | 0.418 |  |
| eu-north-1 | 0.452 |  |
| eu-south-1 | 0.427 |  |
| eu-south-2 | 0.433 |  |
| eu-west-1 | 0.324 |  |
| eu-west-2 | 0.358 |  |
| eu-west-3 | 0.378 |  |
| il-central-1 | 0.557 |  |
| me-central-1 | 0.784 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.508 |  |
| us-east-1 | 0.062 | 4675 |
| us-east-2 | 0.079 | 1607 |
| us-gov-east-1 | 0.083 | 1700 |
| us-gov-west-1 | 0.312 | 195 |
| us-west-1 | 0.251 | 3587 |
| us-west-2 | 0.304 | 158 |

