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
Updated: 2026-02-14T20:17:58.791044+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.940 |  |
| ap-east-1 | 0.743 |  |
| ap-east-2 | 0.700 |  |
| ap-northeast-1 | 0.580 |  |
| ap-northeast-2 | 0.676 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.820 |  |
| ap-southeast-2 | 0.723 |  |
| ap-southeast-3 | 0.885 |  |
| ap-southeast-4 | 0.782 |  |
| ap-southeast-5 | 0.855 |  |
| ap-southeast-6 | 0.782 |  |
| ap-southeast-7 | 0.938 |  |
| ca-central-1 | 0.163 | 16 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.448 |  |
| eu-central-2 | 0.474 |  |
| eu-north-1 | 0.500 |  |
| eu-south-1 | 0.489 |  |
| eu-south-2 | 0.488 |  |
| eu-west-1 | 0.373 |  |
| eu-west-2 | 0.418 |  |
| eu-west-3 | 0.434 |  |
| il-central-1 | 0.634 |  |
| me-central-1 | 0.841 |  |
| me-south-1 | 0.794 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.559 |  |
| us-east-1 | 0.121 | 4122 |
| us-east-2 | 0.133 | 1340 |
| us-gov-east-1 | 0.131 | 1467 |
| us-gov-west-1 | 0.246 | 147 |
| us-west-1 | 0.204 | 3060 |
| us-west-2 | 0.247 | 125 |

