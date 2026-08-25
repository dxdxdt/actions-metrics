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
Updated: 2026-08-25T02:14:44.642491+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.920 |  |
| ap-east-1 | 0.739 |  |
| ap-east-2 | 0.677 |  |
| ap-northeast-1 | 0.559 |  |
| ap-northeast-2 | 0.668 |  |
| ap-northeast-3 | 0.585 |  |
| ap-south-1 | 0.875 |  |
| ap-south-2 | 0.943 |  |
| ap-southeast-1 | 0.822 |  |
| ap-southeast-2 | 0.722 |  |
| ap-southeast-3 | 0.868 |  |
| ap-southeast-4 | 0.766 |  |
| ap-southeast-5 | 0.843 |  |
| ap-southeast-6 | 0.750 |  |
| ap-southeast-7 | 0.926 |  |
| ca-central-1 | 0.155 | 18 |
| ca-west-1 | 0.276 |  |
| eu-central-1 | 0.445 |  |
| eu-central-2 | 0.477 |  |
| eu-north-1 | 0.491 |  |
| eu-south-1 | 0.470 |  |
| eu-south-2 | 0.492 |  |
| eu-west-1 | 0.369 |  |
| eu-west-2 | 0.393 |  |
| eu-west-3 | 0.419 |  |
| il-central-1 | 0.592 |  |
| me-central-1 | 0.812 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.199 |  |
| sa-east-1 | 0.566 |  |
| us-east-1 | 0.122 | 5056 |
| us-east-2 | 0.116 | 1684 |
| us-gov-east-1 | 0.122 | 1881 |
| us-gov-west-1 | 0.246 | 227 |
| us-west-1 | 0.186 | 4049 |
| us-west-2 | 0.246 | 186 |

