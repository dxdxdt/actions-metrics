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
Updated: 2026-05-14T16:07:01.439982+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.873 |  |
| ap-east-1 | 0.819 |  |
| ap-east-2 | 0.756 |  |
| ap-northeast-1 | 0.653 |  |
| ap-northeast-2 | 0.742 |  |
| ap-northeast-3 | 0.679 |  |
| ap-south-1 | 0.833 |  |
| ap-south-2 | 0.961 |  |
| ap-southeast-1 | 0.966 |  |
| ap-southeast-2 | 0.820 |  |
| ap-southeast-3 | 0.947 |  |
| ap-southeast-4 | 0.861 |  |
| ap-southeast-5 | 0.922 |  |
| ap-southeast-6 | 0.849 |  |
| ap-southeast-7 | 1.002 |  |
| ca-central-1 | 0.110 | 16 |
| ca-west-1 | 0.273 |  |
| eu-central-1 | 0.395 |  |
| eu-central-2 | 0.408 |  |
| eu-north-1 | 0.452 |  |
| eu-south-1 | 0.410 |  |
| eu-south-2 | 0.425 |  |
| eu-west-1 | 0.310 |  |
| eu-west-2 | 0.345 |  |
| eu-west-3 | 0.371 |  |
| il-central-1 | 0.553 |  |
| me-central-1 | 0.772 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.494 |  |
| us-east-1 | 0.056 | 4637 |
| us-east-2 | 0.077 | 1593 |
| us-gov-east-1 | 0.087 | 1689 |
| us-gov-west-1 | 0.331 | 195 |
| us-west-1 | 0.271 | 3561 |
| us-west-2 | 0.322 | 158 |

