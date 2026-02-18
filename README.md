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
Updated: 2026-02-18T17:49:08.477219+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.988 |  |
| ap-east-1 | 0.717 |  |
| ap-east-2 | 0.654 |  |
| ap-northeast-1 | 0.536 |  |
| ap-northeast-2 | 0.647 |  |
| ap-northeast-3 | 0.564 |  |
| ap-south-1 | 0.941 |  |
| ap-south-2 | 0.983 |  |
| ap-southeast-1 | 0.788 |  |
| ap-southeast-2 | 0.708 |  |
| ap-southeast-3 | 0.848 |  |
| ap-southeast-4 | 0.750 |  |
| ap-southeast-5 | 0.813 |  |
| ap-southeast-6 | 0.752 |  |
| ap-southeast-7 | 0.899 |  |
| ca-central-1 | 0.148 | 16 |
| ca-west-1 | 0.221 |  |
| eu-central-1 | 0.484 |  |
| eu-central-2 | 0.512 |  |
| eu-north-1 | 0.539 |  |
| eu-south-1 | 0.518 |  |
| eu-south-2 | 0.524 |  |
| eu-west-1 | 0.416 |  |
| eu-west-2 | 0.450 |  |
| eu-west-3 | 0.472 |  |
| il-central-1 | 0.684 |  |
| me-central-1 | 0.861 |  |
| me-south-1 | 0.822 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.581 |  |
| us-east-1 | 0.133 | 4139 |
| us-east-2 | 0.120 | 1354 |
| us-gov-east-1 | 0.110 | 1490 |
| us-gov-west-1 | 0.194 | 155 |
| us-west-1 | 0.208 | 3074 |
| us-west-2 | 0.205 | 127 |

