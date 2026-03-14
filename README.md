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
Updated: 2026-03-14T17:21:20.018195+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.039 |  |
| ap-east-1 | 0.660 |  |
| ap-east-2 | 0.609 |  |
| ap-northeast-1 | 0.487 |  |
| ap-northeast-2 | 0.595 |  |
| ap-northeast-3 | 0.513 |  |
| ap-south-1 | 0.907 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.738 |  |
| ap-southeast-2 | 0.631 |  |
| ap-southeast-3 | 0.794 |  |
| ap-southeast-4 | 0.669 |  |
| ap-southeast-5 | 0.755 |  |
| ap-southeast-6 | 0.697 |  |
| ap-southeast-7 | 0.846 |  |
| ca-central-1 | 0.240 | 16 |
| ca-west-1 | 0.185 |  |
| eu-central-1 | 0.551 |  |
| eu-central-2 | 0.578 |  |
| eu-north-1 | 0.607 |  |
| eu-south-1 | 0.595 |  |
| eu-south-2 | 0.591 |  |
| eu-west-1 | 0.481 |  |
| eu-west-2 | 0.510 |  |
| eu-west-3 | 0.532 |  |
| il-central-1 | 0.751 |  |
| me-central-1 | 0.937 |  |
| me-south-1 | 0.894 |  |
| mx-central-1 | 0.261 |  |
| sa-east-1 | 0.670 |  |
| us-east-1 | 0.217 | 4279 |
| us-east-2 | 0.189 | 1422 |
| us-gov-east-1 | 0.188 | 1576 |
| us-gov-west-1 | 0.143 | 184 |
| us-west-1 | 0.116 | 3229 |
| us-west-2 | 0.146 | 146 |

