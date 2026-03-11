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
Updated: 2026-03-11T04:03:35.343137+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.930 |  |
| ap-east-1 | 0.759 |  |
| ap-east-2 | 0.708 |  |
| ap-northeast-1 | 0.583 |  |
| ap-northeast-2 | 0.693 |  |
| ap-northeast-3 | 0.611 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.918 |  |
| ap-southeast-1 | 0.836 |  |
| ap-southeast-2 | 0.764 |  |
| ap-southeast-3 | 0.895 |  |
| ap-southeast-4 | 0.798 |  |
| ap-southeast-5 | 0.855 |  |
| ap-southeast-6 | 0.819 |  |
| ap-southeast-7 | 0.935 |  |
| ca-central-1 | 0.114 | 16 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.435 |  |
| eu-central-2 | 0.457 |  |
| eu-north-1 | 0.479 |  |
| eu-south-1 | 0.459 |  |
| eu-south-2 | 0.472 |  |
| eu-west-1 | 0.362 |  |
| eu-west-2 | 0.390 |  |
| eu-west-3 | 0.416 |  |
| il-central-1 | 0.602 |  |
| me-central-1 | 0.806 |  |
| me-south-1 | 0.768 |  |
| mx-central-1 | 0.259 |  |
| sa-east-1 | 0.537 |  |
| us-east-1 | 0.084 | 4257 |
| us-east-2 | 0.082 | 1417 |
| us-gov-east-1 | 0.082 | 1557 |
| us-gov-west-1 | 0.245 | 178 |
| us-west-1 | 0.244 | 3207 |
| us-west-2 | 0.258 | 144 |

