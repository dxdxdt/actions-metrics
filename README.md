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
Updated: 2026-03-18T10:44:00.018504+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.932 |  |
| ap-east-1 | 0.754 |  |
| ap-east-2 | 0.685 |  |
| ap-northeast-1 | 0.568 |  |
| ap-northeast-2 | 0.689 |  |
| ap-northeast-3 | 0.594 |  |
| ap-south-1 | 0.875 |  |
| ap-south-2 | 0.965 |  |
| ap-southeast-1 | 0.830 |  |
| ap-southeast-2 | 0.718 |  |
| ap-southeast-3 | 0.881 |  |
| ap-southeast-4 | 0.769 |  |
| ap-southeast-5 | 0.850 |  |
| ap-southeast-6 | 0.773 |  |
| ap-southeast-7 | 0.933 |  |
| ca-central-1 | 0.160 | 16 |
| ca-west-1 | 0.245 |  |
| eu-central-1 | 0.445 |  |
| eu-central-2 | 0.473 |  |
| eu-north-1 | 0.505 |  |
| eu-south-1 | 0.485 |  |
| eu-south-2 | 0.476 |  |
| eu-west-1 | 0.377 |  |
| eu-west-2 | 0.405 |  |
| eu-west-3 | 0.422 |  |
| il-central-1 | 0.616 |  |
| me-central-1 | 0.832 |  |
| me-south-1 | 0.796 |  |
| mx-central-1 | 0.271 |  |
| sa-east-1 | 0.551 |  |
| us-east-1 | 0.117 | 4301 |
| us-east-2 | 0.125 | 1432 |
| us-gov-east-1 | 0.133 | 1586 |
| us-gov-west-1 | 0.246 | 189 |
| us-west-1 | 0.196 | 3250 |
| us-west-2 | 0.242 | 148 |

