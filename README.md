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
Updated: 2026-03-12T15:52:10.534896+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.871 |  |
| ap-east-1 | 0.817 |  |
| ap-east-2 | 0.750 |  |
| ap-northeast-1 | 0.627 |  |
| ap-northeast-2 | 0.752 |  |
| ap-northeast-3 | 0.655 |  |
| ap-south-1 | 0.829 |  |
| ap-south-2 | 0.894 |  |
| ap-southeast-1 | 0.897 |  |
| ap-southeast-2 | 0.841 |  |
| ap-southeast-3 | 0.958 |  |
| ap-southeast-4 | 0.838 |  |
| ap-southeast-5 | 0.908 |  |
| ap-southeast-6 | 0.841 |  |
| ap-southeast-7 | 1.002 |  |
| ca-central-1 | 0.108 | 16 |
| ca-west-1 | 0.293 |  |
| eu-central-1 | 0.366 |  |
| eu-central-2 | 0.393 |  |
| eu-north-1 | 0.431 |  |
| eu-south-1 | 0.411 |  |
| eu-south-2 | 0.407 |  |
| eu-west-1 | 0.302 |  |
| eu-west-2 | 0.336 |  |
| eu-west-3 | 0.352 |  |
| il-central-1 | 0.578 |  |
| me-central-1 | 0.740 |  |
| me-south-1 | 0.715 |  |
| mx-central-1 | 0.249 |  |
| sa-east-1 | 0.478 |  |
| us-east-1 | 0.051 | 4270 |
| us-east-2 | 0.097 | 1419 |
| us-gov-east-1 | 0.101 | 1565 |
| us-gov-west-1 | 0.319 | 180 |
| us-west-1 | 0.256 | 3214 |
| us-west-2 | 0.322 | 144 |

