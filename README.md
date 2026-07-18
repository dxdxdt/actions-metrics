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
Updated: 2026-07-18T06:55:23.440287+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.065 |  |
| ap-east-1 | 0.635 |  |
| ap-east-2 | 0.574 |  |
| ap-northeast-1 | 0.470 |  |
| ap-northeast-2 | 0.562 |  |
| ap-northeast-3 | 0.481 |  |
| ap-south-1 | 0.909 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.708 |  |
| ap-southeast-2 | 0.587 |  |
| ap-southeast-3 | 0.762 |  |
| ap-southeast-4 | 0.627 |  |
| ap-southeast-5 | 0.732 |  |
| ap-southeast-6 | 0.660 |  |
| ap-southeast-7 | 0.809 |  |
| ca-central-1 | 0.287 | 16 |
| ca-west-1 | 0.183 |  |
| eu-central-1 | 0.581 |  |
| eu-central-2 | 0.600 |  |
| eu-north-1 | 0.625 |  |
| eu-south-1 | 0.603 |  |
| eu-south-2 | 0.603 |  |
| eu-west-1 | 0.495 |  |
| eu-west-2 | 0.532 |  |
| eu-west-3 | 0.553 |  |
| il-central-1 | 0.727 |  |
| me-central-1 | 0.957 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.703 |  |
| us-east-1 | 0.249 | 4877 |
| us-east-2 | 0.243 | 1657 |
| us-gov-east-1 | 0.218 | 1766 |
| us-gov-west-1 | 0.114 | 203 |
| us-west-1 | 0.056 | 3796 |
| us-west-2 | 0.114 | 166 |

