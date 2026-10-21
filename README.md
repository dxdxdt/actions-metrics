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
Updated: 2026-10-21T15:47:01.574690+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.875 |  |
| ap-east-1 | 0.796 |  |
| ap-east-2 | 0.728 |  |
| ap-northeast-1 | 0.605 |  |
| ap-northeast-2 | 0.705 |  |
| ap-northeast-3 | 0.639 |  |
| ap-south-1 | 0.880 |  |
| ap-south-2 | 0.923 |  |
| ap-southeast-1 | 0.875 |  |
| ap-southeast-2 | 0.766 |  |
| ap-southeast-3 | 0.919 |  |
| ap-southeast-4 | 0.837 |  |
| ap-southeast-5 | 0.893 |  |
| ap-southeast-6 | 0.820 |  |
| ap-southeast-7 | 0.970 |  |
| ca-central-1 | 0.111 | 18 |
| ca-west-1 | 0.242 |  |
| eu-central-1 | 0.403 |  |
| eu-central-2 | 0.448 |  |
| eu-north-1 | 0.461 |  |
| eu-south-1 | 0.423 |  |
| eu-south-2 | 0.411 |  |
| eu-west-1 | 0.329 |  |
| eu-west-2 | 0.359 |  |
| eu-west-3 | 0.378 |  |
| il-central-1 | 0.562 |  |
| me-central-1 | 0.783 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.499 |  |
| us-east-1 | 0.066 | 5156 |
| us-east-2 | 0.092 | 1704 |
| us-gov-east-1 | 0.110 | 1951 |
| us-gov-west-1 | 0.296 | 239 |
| us-west-1 | 0.230 | 4182 |
| us-west-2 | 0.294 | 195 |

