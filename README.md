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
Updated: 2026-03-16T08:04:10.695065+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.958 |  |
| ap-east-1 | 0.734 |  |
| ap-east-2 | 0.679 |  |
| ap-northeast-1 | 0.558 |  |
| ap-northeast-2 | 0.669 |  |
| ap-northeast-3 | 0.583 |  |
| ap-south-1 | 0.933 |  |
| ap-south-2 | 0.983 |  |
| ap-southeast-1 | 0.814 |  |
| ap-southeast-2 | 0.722 |  |
| ap-southeast-3 | 0.865 |  |
| ap-southeast-4 | 0.763 |  |
| ap-southeast-5 | 0.831 |  |
| ap-southeast-6 | 0.776 |  |
| ap-southeast-7 | 0.915 |  |
| ca-central-1 | 0.160 | 16 |
| ca-west-1 | 0.239 |  |
| eu-central-1 | 0.472 |  |
| eu-central-2 | 0.491 |  |
| eu-north-1 | 0.530 |  |
| eu-south-1 | 0.499 |  |
| eu-south-2 | 0.506 |  |
| eu-west-1 | 0.406 |  |
| eu-west-2 | 0.431 |  |
| eu-west-3 | 0.448 |  |
| il-central-1 | 0.646 |  |
| me-central-1 | 0.839 |  |
| me-south-1 | 0.800 |  |
| mx-central-1 | 0.218 |  |
| sa-east-1 | 0.570 |  |
| us-east-1 | 0.104 | 4287 |
| us-east-2 | 0.098 | 1429 |
| us-gov-east-1 | 0.106 | 1577 |
| us-gov-west-1 | 0.214 | 185 |
| us-west-1 | 0.220 | 3240 |
| us-west-2 | 0.213 | 148 |

