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
Updated: 2026-07-24T18:13:03.975496+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.894 |  |
| ap-east-1 | 0.802 |  |
| ap-east-2 | 0.746 |  |
| ap-northeast-1 | 0.625 |  |
| ap-northeast-2 | 0.728 |  |
| ap-northeast-3 | 0.649 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.906 |  |
| ap-southeast-1 | 0.875 |  |
| ap-southeast-2 | 0.778 |  |
| ap-southeast-3 | 0.933 |  |
| ap-southeast-4 | 0.824 |  |
| ap-southeast-5 | 0.897 |  |
| ap-southeast-6 | 0.819 |  |
| ap-southeast-7 | 0.980 |  |
| ca-central-1 | 0.141 | 16 |
| ca-west-1 | 0.275 |  |
| eu-central-1 | 0.413 |  |
| eu-central-2 | 0.438 |  |
| eu-north-1 | 0.483 |  |
| eu-south-1 | 0.442 |  |
| eu-south-2 | 0.450 |  |
| eu-west-1 | 0.347 |  |
| eu-west-2 | 0.375 |  |
| eu-west-3 | 0.392 |  |
| il-central-1 | 0.579 |  |
| me-central-1 | 0.819 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.521 |  |
| us-east-1 | 0.086 | 4905 |
| us-east-2 | 0.118 | 1661 |
| us-gov-east-1 | 0.124 | 1777 |
| us-gov-west-1 | 0.311 | 206 |
| us-west-1 | 0.250 | 3827 |
| us-west-2 | 0.311 | 170 |

