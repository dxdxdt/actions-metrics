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
Updated: 2026-08-22T12:22:26.155698+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.936 |  |
| ap-east-1 | 0.731 |  |
| ap-east-2 | 0.666 |  |
| ap-northeast-1 | 0.547 |  |
| ap-northeast-2 | 0.655 |  |
| ap-northeast-3 | 0.574 |  |
| ap-south-1 | 0.858 |  |
| ap-south-2 | 0.878 |  |
| ap-southeast-1 | 0.825 |  |
| ap-southeast-2 | 0.696 |  |
| ap-southeast-3 | 0.865 |  |
| ap-southeast-4 | 0.746 |  |
| ap-southeast-5 | 0.838 |  |
| ap-southeast-6 | 0.740 |  |
| ap-southeast-7 | 0.918 |  |
| ca-central-1 | 0.192 | 18 |
| ca-west-1 | 0.259 |  |
| eu-central-1 | 0.462 |  |
| eu-central-2 | 0.489 |  |
| eu-north-1 | 0.521 |  |
| eu-south-1 | 0.491 |  |
| eu-south-2 | 0.496 |  |
| eu-west-1 | 0.386 |  |
| eu-west-2 | 0.420 |  |
| eu-west-3 | 0.436 |  |
| il-central-1 | 0.617 |  |
| me-central-1 | 0.854 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.569 |  |
| us-east-1 | 0.129 | 5045 |
| us-east-2 | 0.149 | 1681 |
| us-gov-east-1 | 0.152 | 1869 |
| us-gov-west-1 | 0.238 | 225 |
| us-west-1 | 0.175 | 4020 |
| us-west-2 | 0.236 | 184 |

