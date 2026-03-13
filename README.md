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
Updated: 2026-03-13T13:55:41.409999+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.915 |  |
| ap-east-1 | 0.772 |  |
| ap-east-2 | 0.712 |  |
| ap-northeast-1 | 0.591 |  |
| ap-northeast-2 | 0.726 |  |
| ap-northeast-3 | 0.617 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.855 |  |
| ap-southeast-2 | 0.775 |  |
| ap-southeast-3 | 0.910 |  |
| ap-southeast-4 | 0.812 |  |
| ap-southeast-5 | 0.868 |  |
| ap-southeast-6 | 0.859 |  |
| ap-southeast-7 | 0.950 |  |
| ca-central-1 | 0.141 | 16 |
| ca-west-1 | 0.269 |  |
| eu-central-1 | 0.423 |  |
| eu-central-2 | 0.437 |  |
| eu-north-1 | 0.477 |  |
| eu-south-1 | 0.448 |  |
| eu-south-2 | 0.455 |  |
| eu-west-1 | 0.346 |  |
| eu-west-2 | 0.385 |  |
| eu-west-3 | 0.396 |  |
| il-central-1 | 0.598 |  |
| me-central-1 | 0.791 |  |
| me-south-1 | 0.750 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.523 |  |
| us-east-1 | 0.089 | 4276 |
| us-east-2 | 0.122 | 1422 |
| us-gov-east-1 | 0.125 | 1568 |
| us-gov-west-1 | 0.283 | 180 |
| us-west-1 | 0.244 | 3219 |
| us-west-2 | 0.295 | 146 |

