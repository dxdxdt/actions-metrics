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
Updated: 2026-08-05T17:22:38.271662+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.902 |  |
| ap-east-1 | 0.782 |  |
| ap-east-2 | 0.720 |  |
| ap-northeast-1 | 0.601 |  |
| ap-northeast-2 | 0.704 |  |
| ap-northeast-3 | 0.626 |  |
| ap-south-1 | 0.854 |  |
| ap-south-2 | 0.932 |  |
| ap-southeast-1 | 0.860 |  |
| ap-southeast-2 | 0.764 |  |
| ap-southeast-3 | 0.905 |  |
| ap-southeast-4 | 0.805 |  |
| ap-southeast-5 | 0.871 |  |
| ap-southeast-6 | 0.799 |  |
| ap-southeast-7 | 0.960 |  |
| ca-central-1 | 0.113 | 17 |
| ca-west-1 | 0.230 |  |
| eu-central-1 | 0.422 |  |
| eu-central-2 | 0.437 |  |
| eu-north-1 | 0.472 |  |
| eu-south-1 | 0.433 |  |
| eu-south-2 | 0.459 |  |
| eu-west-1 | 0.340 |  |
| eu-west-2 | 0.369 |  |
| eu-west-3 | 0.401 |  |
| il-central-1 | 0.583 |  |
| me-central-1 | 0.799 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.528 |  |
| us-east-1 | 0.077 | 4943 |
| us-east-2 | 0.089 | 1674 |
| us-gov-east-1 | 0.082 | 1803 |
| us-gov-west-1 | 0.283 | 211 |
| us-west-1 | 0.228 | 3886 |
| us-west-2 | 0.282 | 172 |

