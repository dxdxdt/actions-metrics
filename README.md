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
Updated: 2025-10-02T16:15:03.593675+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.941 |  |
| ap-east-1 | 0.763 |  |
| ap-northeast-1 | 0.578 |  |
| ap-northeast-2 | 0.678 |  |
| ap-south-1 | 0.974 |  |
| ap-southeast-1 | 0.824 |  |
| ap-southeast-2 | 0.734 |  |
| ca-central-1 | 0.114 | 15 |
| eu-central-1 | 0.454 |  |
| eu-north-1 | 0.492 |  |
| eu-south-1 | 0.472 |  |
| eu-west-1 | 0.365 |  |
| eu-west-2 | 0.406 |  |
| eu-west-3 | 0.428 |  |
| me-south-1 | 0.758 |  |
| sa-east-1 | 0.556 |  |
| us-east-1 | 0.104 | 3210 |
| us-east-2 | 0.077 | 838 |
| us-gov-east-1 | 0.081 | 1043 |
| us-gov-west-1 | 0.221 | 42 |
| us-west-1 | 0.229 | 2140 |
| us-west-2 | 0.218 | 18 |

