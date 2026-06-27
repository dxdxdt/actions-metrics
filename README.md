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
Updated: 2026-06-27T20:04:52.574085+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.907 |  |
| ap-east-1 | 0.773 |  |
| ap-east-2 | 0.716 |  |
| ap-northeast-1 | 0.596 |  |
| ap-northeast-2 | 0.701 |  |
| ap-northeast-3 | 0.623 |  |
| ap-south-1 | 0.855 |  |
| ap-south-2 | 0.911 |  |
| ap-southeast-1 | 0.851 |  |
| ap-southeast-2 | 0.756 |  |
| ap-southeast-3 | 0.899 |  |
| ap-southeast-4 | 0.793 |  |
| ap-southeast-5 | 0.868 |  |
| ap-southeast-6 | 0.778 |  |
| ap-southeast-7 | 0.952 |  |
| ca-central-1 | 0.104 | 16 |
| ca-west-1 | 0.245 |  |
| eu-central-1 | 0.423 |  |
| eu-central-2 | 0.450 |  |
| eu-north-1 | 0.482 |  |
| eu-south-1 | 0.453 |  |
| eu-south-2 | 0.462 |  |
| eu-west-1 | 0.354 |  |
| eu-west-2 | 0.382 |  |
| eu-west-3 | 0.405 |  |
| il-central-1 | 0.571 |  |
| me-central-1 | 0.808 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.218 |  |
| sa-east-1 | 0.543 |  |
| us-east-1 | 0.080 | 4793 |
| us-east-2 | 0.068 | 1644 |
| us-gov-east-1 | 0.068 | 1723 |
| us-gov-west-1 | 0.271 | 199 |
| us-west-1 | 0.212 | 3713 |
| us-west-2 | 0.268 | 163 |

