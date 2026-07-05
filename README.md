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
Updated: 2026-07-05T09:36:43.863022+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.997 |  |
| ap-east-1 | 0.698 |  |
| ap-east-2 | 0.640 |  |
| ap-northeast-1 | 0.519 |  |
| ap-northeast-2 | 0.627 |  |
| ap-northeast-3 | 0.545 |  |
| ap-south-1 | 0.866 |  |
| ap-south-2 | 0.859 |  |
| ap-southeast-1 | 0.772 |  |
| ap-southeast-2 | 0.661 |  |
| ap-southeast-3 | 0.827 |  |
| ap-southeast-4 | 0.707 |  |
| ap-southeast-5 | 0.793 |  |
| ap-southeast-6 | 0.699 |  |
| ap-southeast-7 | 0.877 |  |
| ca-central-1 | 0.239 | 16 |
| ca-west-1 | 0.224 |  |
| eu-central-1 | 0.519 |  |
| eu-central-2 | 0.544 |  |
| eu-north-1 | 0.567 |  |
| eu-south-1 | 0.558 |  |
| eu-south-2 | 0.558 |  |
| eu-west-1 | 0.439 |  |
| eu-west-2 | 0.469 |  |
| eu-west-3 | 0.499 |  |
| il-central-1 | 0.679 |  |
| me-central-1 | 0.885 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.621 |  |
| us-east-1 | 0.181 | 4822 |
| us-east-2 | 0.182 | 1652 |
| us-gov-east-1 | 0.188 | 1729 |
| us-gov-west-1 | 0.187 | 200 |
| us-west-1 | 0.131 | 3744 |
| us-west-2 | 0.187 | 164 |

