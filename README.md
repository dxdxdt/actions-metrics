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
Updated: 2026-08-17T13:33:46.850036+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.028 |  |
| ap-east-1 | 0.669 |  |
| ap-east-2 | 0.607 |  |
| ap-northeast-1 | 0.491 |  |
| ap-northeast-2 | 0.600 |  |
| ap-northeast-3 | 0.518 |  |
| ap-south-1 | 0.904 |  |
| ap-south-2 | 0.922 |  |
| ap-southeast-1 | 0.744 |  |
| ap-southeast-2 | 0.633 |  |
| ap-southeast-3 | 0.800 |  |
| ap-southeast-4 | 0.674 |  |
| ap-southeast-5 | 0.761 |  |
| ap-southeast-6 | 0.665 |  |
| ap-southeast-7 | 0.843 |  |
| ca-central-1 | 0.241 | 18 |
| ca-west-1 | 0.198 |  |
| eu-central-1 | 0.540 |  |
| eu-central-2 | 0.559 |  |
| eu-north-1 | 0.572 |  |
| eu-south-1 | 0.564 |  |
| eu-south-2 | 0.567 |  |
| eu-west-1 | 0.464 |  |
| eu-west-2 | 0.503 |  |
| eu-west-3 | 0.516 |  |
| il-central-1 | 0.703 |  |
| me-central-1 | 0.906 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.219 |  |
| sa-east-1 | 0.662 |  |
| us-east-1 | 0.203 | 5011 |
| us-east-2 | 0.209 | 1680 |
| us-gov-east-1 | 0.173 | 1839 |
| us-gov-west-1 | 0.155 | 224 |
| us-west-1 | 0.097 | 3976 |
| us-west-2 | 0.154 | 181 |

