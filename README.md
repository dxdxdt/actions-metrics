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
Updated: 2026-09-29T23:18:36.160983+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.975 |  |
| ap-east-1 | 0.693 |  |
| ap-east-2 | 0.626 |  |
| ap-northeast-1 | 0.510 |  |
| ap-northeast-2 | 0.607 |  |
| ap-northeast-3 | 0.537 |  |
| ap-south-1 | 0.894 |  |
| ap-south-2 | 0.883 |  |
| ap-southeast-1 | 0.795 |  |
| ap-southeast-2 | 0.667 |  |
| ap-southeast-3 | 0.825 |  |
| ap-southeast-4 | 0.714 |  |
| ap-southeast-5 | 0.796 |  |
| ap-southeast-6 | 0.721 |  |
| ap-southeast-7 | 0.873 |  |
| ca-central-1 | 0.214 | 18 |
| ca-west-1 | 0.257 |  |
| eu-central-1 | 0.487 |  |
| eu-central-2 | 0.520 |  |
| eu-north-1 | 0.552 |  |
| eu-south-1 | 0.524 |  |
| eu-south-2 | 0.577 |  |
| eu-west-1 | 0.414 |  |
| eu-west-2 | 0.447 |  |
| eu-west-3 | 0.466 |  |
| il-central-1 | 0.655 |  |
| me-central-1 | 0.895 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.210 |  |
| sa-east-1 | 0.601 |  |
| us-east-1 | 0.161 | 5129 |
| us-east-2 | 0.197 | 1687 |
| us-gov-east-1 | 0.200 | 1930 |
| us-gov-west-1 | 0.211 | 236 |
| us-west-1 | 0.142 | 4147 |
| us-west-2 | 0.209 | 192 |

