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
Updated: 2026-08-16T10:15:12.218355+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.879 |  |
| ap-east-1 | 0.803 |  |
| ap-east-2 | 0.749 |  |
| ap-northeast-1 | 0.628 |  |
| ap-northeast-2 | 0.730 |  |
| ap-northeast-3 | 0.656 |  |
| ap-south-1 | 0.826 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.885 |  |
| ap-southeast-2 | 0.785 |  |
| ap-southeast-3 | 0.937 |  |
| ap-southeast-4 | 0.831 |  |
| ap-southeast-5 | 0.895 |  |
| ap-southeast-6 | 0.833 |  |
| ap-southeast-7 | 0.986 |  |
| ca-central-1 | 0.120 | 18 |
| ca-west-1 | 0.285 |  |
| eu-central-1 | 0.395 |  |
| eu-central-2 | 0.417 |  |
| eu-north-1 | 0.433 |  |
| eu-south-1 | 0.421 |  |
| eu-south-2 | 0.429 |  |
| eu-west-1 | 0.309 |  |
| eu-west-2 | 0.347 |  |
| eu-west-3 | 0.372 |  |
| il-central-1 | 0.545 |  |
| me-central-1 | 0.801 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.492 |  |
| us-east-1 | 0.057 | 5008 |
| us-east-2 | 0.100 | 1679 |
| us-gov-east-1 | 0.103 | 1832 |
| us-gov-west-1 | 0.304 | 223 |
| us-west-1 | 0.251 | 3964 |
| us-west-2 | 0.300 | 179 |

