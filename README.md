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
Updated: 2026-04-16T22:33:13.303625+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.022 |  |
| ap-east-1 | 0.684 |  |
| ap-east-2 | 0.619 |  |
| ap-northeast-1 | 0.501 |  |
| ap-northeast-2 | 0.602 |  |
| ap-northeast-3 | 0.531 |  |
| ap-south-1 | 0.921 |  |
| ap-south-2 | 0.923 |  |
| ap-southeast-1 | 0.757 |  |
| ap-southeast-2 | 0.653 |  |
| ap-southeast-3 | 0.813 |  |
| ap-southeast-4 | 0.688 |  |
| ap-southeast-5 | 0.770 |  |
| ap-southeast-6 | 0.683 |  |
| ap-southeast-7 | 0.856 |  |
| ca-central-1 | 0.226 | 16 |
| ca-west-1 | 0.238 |  |
| eu-central-1 | 0.529 |  |
| eu-central-2 | 0.561 |  |
| eu-north-1 | 0.589 |  |
| eu-south-1 | 0.551 |  |
| eu-south-2 | 0.577 |  |
| eu-west-1 | 0.465 |  |
| eu-west-2 | 0.493 |  |
| eu-west-3 | 0.518 |  |
| il-central-1 | 0.705 |  |
| me-central-1 | 0.892 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.653 |  |
| us-east-1 | 0.184 | 4512 |
| us-east-2 | 0.161 | 1506 |
| us-gov-east-1 | 0.176 | 1652 |
| us-gov-west-1 | 0.168 | 193 |
| us-west-1 | 0.114 | 3422 |
| us-west-2 | 0.169 | 156 |

