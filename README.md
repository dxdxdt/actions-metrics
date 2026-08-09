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
Updated: 2026-08-09T14:26:35.117707+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.891 |  |
| ap-east-1 | 0.792 |  |
| ap-east-2 | 0.696 |  |
| ap-northeast-1 | 0.617 |  |
| ap-northeast-2 | 0.717 |  |
| ap-northeast-3 | 0.641 |  |
| ap-south-1 | 0.841 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.865 |  |
| ap-southeast-2 | 0.765 |  |
| ap-southeast-3 | 0.926 |  |
| ap-southeast-4 | 0.807 |  |
| ap-southeast-5 | 0.887 |  |
| ap-southeast-6 | 0.820 |  |
| ap-southeast-7 | 0.970 |  |
| ca-central-1 | 0.126 | 18 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.400 |  |
| eu-central-2 | 0.430 |  |
| eu-north-1 | 0.438 |  |
| eu-south-1 | 0.426 |  |
| eu-south-2 | 0.434 |  |
| eu-west-1 | 0.323 |  |
| eu-west-2 | 0.359 |  |
| eu-west-3 | 0.390 |  |
| il-central-1 | 0.564 |  |
| me-central-1 | 0.798 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.507 |  |
| us-east-1 | 0.069 | 4962 |
| us-east-2 | 0.095 | 1677 |
| us-gov-east-1 | 0.103 | 1812 |
| us-gov-west-1 | 0.286 | 214 |
| us-west-1 | 0.233 | 3912 |
| us-west-2 | 0.286 | 175 |

