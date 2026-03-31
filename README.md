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
Updated: 2026-03-31T23:28:41.019288+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.942 |  |
| ap-east-1 | 0.758 |  |
| ap-east-2 | 0.691 |  |
| ap-northeast-1 | 0.577 |  |
| ap-northeast-2 | 0.690 |  |
| ap-northeast-3 | 0.597 |  |
| ap-south-1 | 0.858 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.832 |  |
| ap-southeast-2 | 0.748 |  |
| ap-southeast-3 | 0.888 |  |
| ap-southeast-4 | 0.790 |  |
| ap-southeast-5 | 0.852 |  |
| ap-southeast-6 | 0.796 |  |
| ap-southeast-7 | 0.932 |  |
| ca-central-1 | 0.166 | 16 |
| ca-west-1 | 0.304 |  |
| eu-central-1 | 0.448 |  |
| eu-central-2 | 0.474 |  |
| eu-north-1 | 0.499 |  |
| eu-south-1 | 0.467 |  |
| eu-south-2 | 0.484 |  |
| eu-west-1 | 0.376 |  |
| eu-west-2 | 0.414 |  |
| eu-west-3 | 0.422 |  |
| il-central-1 | 0.619 |  |
| me-central-1 | 0.824 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.543 |  |
| us-east-1 | 0.104 | 4411 |
| us-east-2 | 0.118 | 1469 |
| us-gov-east-1 | 0.131 | 1618 |
| us-gov-west-1 | 0.277 | 190 |
| us-west-1 | 0.223 | 3328 |
| us-west-2 | 0.276 | 152 |

