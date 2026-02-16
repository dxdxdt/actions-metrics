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
Updated: 2026-02-16T11:35:21.578484+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.009 |  |
| ap-east-1 | 0.679 |  |
| ap-east-2 | 0.604 |  |
| ap-northeast-1 | 0.487 |  |
| ap-northeast-2 | 0.594 |  |
| ap-south-1 | 0.941 |  |
| ap-south-2 | 0.942 |  |
| ap-southeast-1 | 0.743 |  |
| ap-southeast-2 | 0.647 |  |
| ap-southeast-3 | 0.807 |  |
| ap-southeast-4 | 0.690 |  |
| ap-southeast-5 | 0.764 |  |
| ap-southeast-6 | 0.691 |  |
| ap-southeast-7 | 0.847 |  |
| ca-central-1 | 0.237 | 16 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.538 |  |
| eu-central-2 | 0.538 |  |
| eu-north-1 | 0.569 |  |
| eu-south-1 | 0.557 |  |
| eu-south-2 | 0.571 |  |
| eu-west-1 | 0.455 |  |
| eu-west-2 | 0.481 |  |
| eu-west-3 | 0.510 |  |
| il-central-1 | 0.702 |  |
| me-central-1 | 0.905 |  |
| me-south-1 | 0.871 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.635 |  |
| us-east-1 | 0.188 | 4129 |
| us-east-2 | 0.173 | 1348 |
| us-gov-east-1 | 0.173 | 1476 |
| us-gov-west-1 | 0.155 | 149 |
| us-west-1 | 0.139 | 3065 |
| us-west-2 | 0.158 | 126 |

