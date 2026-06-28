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
Updated: 2026-06-28T16:04:26.625305+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.016 |  |
| ap-east-1 | 0.676 |  |
| ap-east-2 | 0.615 |  |
| ap-northeast-1 | 0.500 |  |
| ap-northeast-2 | 0.605 |  |
| ap-northeast-3 | 0.524 |  |
| ap-south-1 | 0.895 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.751 |  |
| ap-southeast-2 | 0.637 |  |
| ap-southeast-3 | 0.803 |  |
| ap-southeast-4 | 0.682 |  |
| ap-southeast-5 | 0.770 |  |
| ap-southeast-6 | 0.670 |  |
| ap-southeast-7 | 0.857 |  |
| ca-central-1 | 0.253 | 16 |
| ca-west-1 | 0.199 |  |
| eu-central-1 | 0.527 |  |
| eu-central-2 | 0.559 |  |
| eu-north-1 | 0.585 |  |
| eu-south-1 | 0.561 |  |
| eu-south-2 | 0.561 |  |
| eu-west-1 | 0.456 |  |
| eu-west-2 | 0.486 |  |
| eu-west-3 | 0.511 |  |
| il-central-1 | 0.694 |  |
| me-central-1 | 0.903 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.220 |  |
| sa-east-1 | 0.648 |  |
| us-east-1 | 0.199 | 4798 |
| us-east-2 | 0.168 | 1645 |
| us-gov-east-1 | 0.179 | 1723 |
| us-gov-west-1 | 0.160 | 199 |
| us-west-1 | 0.105 | 3716 |
| us-west-2 | 0.160 | 163 |

