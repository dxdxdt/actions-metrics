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
Updated: 2026-08-21T16:22:41.300798+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.958 |  |
| ap-east-1 | 0.732 |  |
| ap-east-2 | 0.669 |  |
| ap-northeast-1 | 0.559 |  |
| ap-northeast-2 | 0.657 |  |
| ap-northeast-3 | 0.577 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.886 |  |
| ap-southeast-1 | 0.812 |  |
| ap-southeast-2 | 0.705 |  |
| ap-southeast-3 | 0.873 |  |
| ap-southeast-4 | 0.754 |  |
| ap-southeast-5 | 0.833 |  |
| ap-southeast-6 | 0.746 |  |
| ap-southeast-7 | 0.917 |  |
| ca-central-1 | 0.211 | 18 |
| ca-west-1 | 0.249 |  |
| eu-central-1 | 0.485 |  |
| eu-central-2 | 0.502 |  |
| eu-north-1 | 0.524 |  |
| eu-south-1 | 0.511 |  |
| eu-south-2 | 0.518 |  |
| eu-west-1 | 0.405 |  |
| eu-west-2 | 0.439 |  |
| eu-west-3 | 0.470 |  |
| il-central-1 | 0.640 |  |
| me-central-1 | 0.877 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.580 |  |
| us-east-1 | 0.141 | 5037 |
| us-east-2 | 0.173 | 1680 |
| us-gov-east-1 | 0.174 | 1865 |
| us-gov-west-1 | 0.241 | 225 |
| us-west-1 | 0.183 | 4014 |
| us-west-2 | 0.239 | 184 |

