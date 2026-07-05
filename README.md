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
Updated: 2026-07-05T02:14:59.886376+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.951 |  |
| ap-east-1 | 0.736 |  |
| ap-east-2 | 0.674 |  |
| ap-northeast-1 | 0.556 |  |
| ap-northeast-2 | 0.659 |  |
| ap-northeast-3 | 0.583 |  |
| ap-south-1 | 0.849 |  |
| ap-south-2 | 0.861 |  |
| ap-southeast-1 | 0.811 |  |
| ap-southeast-2 | 0.712 |  |
| ap-southeast-3 | 0.865 |  |
| ap-southeast-4 | 0.748 |  |
| ap-southeast-5 | 0.833 |  |
| ap-southeast-6 | 0.750 |  |
| ap-southeast-7 | 0.917 |  |
| ca-central-1 | 0.196 | 16 |
| ca-west-1 | 0.255 |  |
| eu-central-1 | 0.470 |  |
| eu-central-2 | 0.489 |  |
| eu-north-1 | 0.513 |  |
| eu-south-1 | 0.504 |  |
| eu-south-2 | 0.502 |  |
| eu-west-1 | 0.387 |  |
| eu-west-2 | 0.427 |  |
| eu-west-3 | 0.448 |  |
| il-central-1 | 0.621 |  |
| me-central-1 | 0.837 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.570 |  |
| us-east-1 | 0.138 | 4821 |
| us-east-2 | 0.153 | 1652 |
| us-gov-east-1 | 0.149 | 1729 |
| us-gov-west-1 | 0.231 | 200 |
| us-west-1 | 0.174 | 3743 |
| us-west-2 | 0.232 | 164 |

