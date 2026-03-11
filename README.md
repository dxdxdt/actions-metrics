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
Updated: 2026-03-11T05:42:59.061263+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.979 |  |
| ap-east-1 | 0.715 |  |
| ap-east-2 | 0.665 |  |
| ap-northeast-1 | 0.537 |  |
| ap-northeast-2 | 0.645 |  |
| ap-northeast-3 | 0.563 |  |
| ap-south-1 | 0.926 |  |
| ap-south-2 | 0.961 |  |
| ap-southeast-1 | 0.790 |  |
| ap-southeast-2 | 0.710 |  |
| ap-southeast-3 | 0.845 |  |
| ap-southeast-4 | 0.748 |  |
| ap-southeast-5 | 0.808 |  |
| ap-southeast-6 | 0.755 |  |
| ap-southeast-7 | 0.887 |  |
| ca-central-1 | 0.168 | 16 |
| ca-west-1 | 0.250 |  |
| eu-central-1 | 0.489 |  |
| eu-central-2 | 0.516 |  |
| eu-north-1 | 0.525 |  |
| eu-south-1 | 0.515 |  |
| eu-south-2 | 0.524 |  |
| eu-west-1 | 0.404 |  |
| eu-west-2 | 0.439 |  |
| eu-west-3 | 0.469 |  |
| il-central-1 | 0.666 |  |
| me-central-1 | 0.853 |  |
| me-south-1 | 0.819 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.593 |  |
| us-east-1 | 0.145 | 4257 |
| us-east-2 | 0.117 | 1417 |
| us-gov-east-1 | 0.116 | 1558 |
| us-gov-west-1 | 0.201 | 178 |
| us-west-1 | 0.201 | 3207 |
| us-west-2 | 0.208 | 144 |

