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
Updated: 2026-04-01T13:00:51.157171+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.061 |  |
| ap-east-1 | 0.647 |  |
| ap-east-2 | 0.588 |  |
| ap-northeast-1 | 0.473 |  |
| ap-northeast-2 | 0.584 |  |
| ap-northeast-3 | 0.497 |  |
| ap-south-1 | 0.909 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.726 |  |
| ap-southeast-2 | 0.605 |  |
| ap-southeast-3 | 0.781 |  |
| ap-southeast-4 | 0.647 |  |
| ap-southeast-5 | 0.741 |  |
| ap-southeast-6 | 0.690 |  |
| ap-southeast-7 | 0.829 |  |
| ca-central-1 | 0.296 | 16 |
| ca-west-1 | 0.191 |  |
| eu-central-1 | 0.573 |  |
| eu-central-2 | 0.607 |  |
| eu-north-1 | 0.633 |  |
| eu-south-1 | 0.597 |  |
| eu-south-2 | 0.594 |  |
| eu-west-1 | 0.499 |  |
| eu-west-2 | 0.537 |  |
| eu-west-3 | 0.542 |  |
| il-central-1 | 0.746 |  |
| me-central-1 | 0.939 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.740 |  |
| us-east-1 | 0.231 | 4414 |
| us-east-2 | 0.209 | 1470 |
| us-gov-east-1 | 0.209 | 1618 |
| us-gov-west-1 | 0.131 | 190 |
| us-west-1 | 0.078 | 3330 |
| us-west-2 | 0.133 | 153 |

