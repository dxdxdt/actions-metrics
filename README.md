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
Updated: 2026-03-04T13:52:43.797117+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.964 |  |
| ap-east-1 | 0.725 |  |
| ap-east-2 | 0.660 |  |
| ap-northeast-1 | 0.540 |  |
| ap-northeast-2 | 0.653 |  |
| ap-northeast-3 | 0.565 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.886 |  |
| ap-southeast-1 | 0.799 |  |
| ap-southeast-2 | 0.688 |  |
| ap-southeast-3 | 0.855 |  |
| ap-southeast-4 | 0.728 |  |
| ap-southeast-5 | 0.827 |  |
| ap-southeast-6 | 0.741 |  |
| ap-southeast-7 | 0.901 |  |
| ca-central-1 | 0.199 | 16 |
| ca-west-1 | 0.230 |  |
| eu-central-1 | 0.481 |  |
| eu-central-2 | 0.500 |  |
| eu-north-1 | 0.534 |  |
| eu-south-1 | 0.518 |  |
| eu-south-2 | 0.520 |  |
| eu-west-1 | 0.408 |  |
| eu-west-2 | 0.434 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.669 |  |
| me-central-1 | 0.871 |  |
| me-south-1 | 0.834 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.587 |  |
| us-east-1 | 0.158 | 4217 |
| us-east-2 | 0.157 | 1397 |
| us-gov-east-1 | 0.156 | 1529 |
| us-gov-west-1 | 0.215 | 169 |
| us-west-1 | 0.163 | 3171 |
| us-west-2 | 0.215 | 140 |

