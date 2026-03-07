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
Updated: 2026-03-07T23:15:54.079594+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.929 |  |
| ap-east-1 | 0.766 |  |
| ap-east-2 | 0.710 |  |
| ap-northeast-1 | 0.587 |  |
| ap-northeast-2 | 0.689 |  |
| ap-northeast-3 | 0.607 |  |
| ap-south-1 | 0.876 |  |
| ap-south-2 | 0.941 |  |
| ap-southeast-1 | 0.834 |  |
| ap-southeast-2 | 0.748 |  |
| ap-southeast-3 | 0.887 |  |
| ap-southeast-4 | 0.788 |  |
| ap-southeast-5 | 0.863 |  |
| ap-southeast-6 | 0.801 |  |
| ap-southeast-7 | 0.942 |  |
| ca-central-1 | 0.100 | 16 |
| ca-west-1 | 0.215 |  |
| eu-central-1 | 0.438 |  |
| eu-central-2 | 0.454 |  |
| eu-north-1 | 0.481 |  |
| eu-south-1 | 0.462 |  |
| eu-south-2 | 0.474 |  |
| eu-west-1 | 0.361 |  |
| eu-west-2 | 0.398 |  |
| eu-west-3 | 0.420 |  |
| il-central-1 | 0.603 |  |
| me-central-1 | 0.813 |  |
| me-south-1 | 0.777 |  |
| mx-central-1 | 0.271 |  |
| sa-east-1 | 0.536 |  |
| us-east-1 | 0.082 | 4237 |
| us-east-2 | 0.071 | 1408 |
| us-gov-east-1 | 0.068 | 1542 |
| us-gov-west-1 | 0.237 | 174 |
| us-west-1 | 0.242 | 3191 |
| us-west-2 | 0.242 | 143 |

